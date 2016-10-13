//
//  CompassTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 13/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class CompassTests: XCTestCase {
    
    func testNorth() {
        XCTAssertEqual(Compass.north, Compass(degrees:   0.0))
        XCTAssertEqual(Compass.north, Compass(degrees:  10.0))
        XCTAssertEqual(Compass.north, Compass(degrees: -10.0))
    }
    
    func testNorthEast() {
        XCTAssertEqual(Compass.northEast, Compass(degrees:   44.0))
        XCTAssertEqual(Compass.northEast, Compass(degrees: -314.0))
    }
    
    func testEast() {
        XCTAssertEqual(Compass.east, Compass(degrees:   91.0))
        XCTAssertEqual(Compass.east, Compass(degrees: -271.0))
    }
    
    func testSouthEast() {
        XCTAssertEqual(Compass.southEast, Compass(degrees:  130.0))
        XCTAssertEqual(Compass.southEast, Compass(degrees: -224.0))
    }
    
    func testSouth1() {
        XCTAssertEqual(Compass.south, Compass(degrees:  179.0))
        XCTAssertEqual(Compass.south, Compass(degrees:  180.0))
        XCTAssertEqual(Compass.south, Compass(degrees:  181.0))
        XCTAssertEqual(Compass.south, Compass(degrees: -179.0))
    }
    
    func testSouthWest() {
        XCTAssertEqual(Compass.southWest, Compass(degrees:  225.0))
        XCTAssertEqual(Compass.southWest, Compass(degrees: -135.0))
    }
    
    func testWest() {
        XCTAssertEqual(Compass.west, Compass(degrees: 270.0))
        XCTAssertEqual(Compass.west, Compass(degrees: -90.0))
    }
    
    func testNorthWest() {
        XCTAssertEqual(Compass.northWest, Compass(degrees: 315.0))
        XCTAssertEqual(Compass.northWest, Compass(degrees: -44.0))
    }
}
