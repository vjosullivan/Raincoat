//
//  DarkSkyClientTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 20/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class DarkSkyClientTests: XCTestCase {
    
    private var callCount = 0
    let homeLocation = Location(latitude: 58.3, longitude: -1.0)
    
    override func setUp() {
        callCount = 0
    }
    
    func testCreatable() {
        let darkSky = DarkSkyClient(location: homeLocation)
        XCTAssertNotNil(darkSky, "DarkSkyClient should be creatable.")
    }
    
    /// Reading the default URL should return data.
    func testDefaultURL() {
        
        let exp = expectation(description: "Default URL.")
        
        let wc = DarkSkyClient(location: homeLocation)
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertDataFound(data, response, error)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            print("\n\nJSON: \(json)\n\n")
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }
    
    /// Reading a missing URL should result in no data and an error.
    func testDefaultClient() {
        
        let exp = expectation(description: "Missing file.")
        
        let wc = createTestClient(testFile: "/missing.file")
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertNoDataFound(data, response, error)
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }

    /// Reading a valid URL containing junk should result in data but no JSON.
    func testCannotReadJunkJson() {
        
        let exp = expectation(description: "Junk JSON.")
        
        let wc = createTestClient(testFile: "/junk.json")
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertDataFound(data, response, error)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            XCTAssertNil(json, "Junk data should result in nil JSON.")
            
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }
    
    /// Reading a valid URL containing "JSON-like" junk should result in data but no JSON.
    func testCannotReadInvalidJson() {
        
        let exp = expectation(description: "Invalid JSON.")
        
        let wc = createTestClient(testFile: "/invalid.json")
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertDataFound(data, response, error)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            XCTAssertNil(json, "Invalid json data should result in nil JSON.")
            
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }
    
    /// Reading an valid URL which is empty should result in data but no JSON.
    func testCannotReadEmptyJson() {
        
        let exp = expectation(description: "Empty JSON.")
        
        let wc = createTestClient(testFile: "/empty.json")
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertDataFound(data, response, error)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            XCTAssertNil(json, "Empty json data should result in nil JSON.")
            
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }
    
    /// Reading valid data from a valid URL should result data
    /// that can be converted into a JSON string.
    func testCanReadJSONFromSimpleJson() {
        
        let exp = expectation(description: "Simple Read.")
        
        let wc = createTestClient(testFile: "/simple.json")
        wc.fetchData(completionHandler:  {(data, response, error) in
            self.assertDataFound(data, response, error)
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject] {
                XCTAssertEqual("simple data", json["simpleKey"] as! String)
            } else {
                XCTAssertFalse(true, "Test should not fail.")
            }
            self.callCount += 1
            exp.fulfill()
        })
        
        assertCompletionHandlerCalled()
    }
    
    // MARK: - Helper methods.
    
    /// Asserts that the following is true:
    ///
    /// - parameter data:     is not nil
    /// - parameter response: is not nil
    /// - parameter error:    is nil
    private func assertDataFound(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        XCTAssertNotNil(data)
        XCTAssertNotNil(response)
        XCTAssertNil(error)
    }

    /// Asserts that the following is true:
    ///
    /// - parameter data:     is nil
    /// - parameter response: is nil
    /// - parameter error:    is not nil
    private func assertNoDataFound(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        XCTAssertNil(data)
        XCTAssertNil(response)
        XCTAssertNotNil(error)
        print("\nError type: \(type(of: error))\n")
    }

    /// Asserts the the call counter has been incremented.
    private func assertCompletionHandlerCalled() {
        waitForExpectations(timeout: 10, handler: { (error) in
            XCTAssertNil(error)
            XCTAssertEqual(1, self.callCount, "Handler should have been called.")
        })
    }

    
    /// Returns a 'DarkSkyClient` initialised from the suppied file.
    ///
    /// - parameter testFile: A local file containg test JSON (or not).
    ///
    /// - returns: An initialised 'DarkSkyClient`.
    ///
    private func createTestClient(testFile: String) -> DarkSkyClient {
        let filePath = Bundle(for: type(of: self)).bundlePath.appending(testFile)
        let fileURL  = URL(fileURLWithPath: filePath)
        return DarkSkyClient(url: fileURL)
    }
}
