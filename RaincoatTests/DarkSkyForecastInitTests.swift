//
//  DarkSkyForecastInitTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 13/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class DarkSkyForecastInitTests: XCTestCase {
    
    func testDSF() {
        var json = [String: AnyObject]()
        XCTAssertNil(DarkSkyForecast(dictionary: json), "Forecast must contain data.")
        let units = ["units": "si" as AnyObject]
        json["flags"] = units as AnyObject
        XCTAssertNil(DarkSkyForecast(dictionary: json), "Forecast must contain lat. and long.")
        json["latitude"] = 51.3 as AnyObject
        json["longitude"] = -1.0 as AnyObject
        json["timezone"] = "Europe/London" as AnyObject
        print(json)
        XCTAssertNotNil(DarkSkyForecast(dictionary: json), "Forecast can be created with minimal data.")
    }

    func testDSF2() {
        var json = [String: AnyObject]()
        XCTAssertNil(DarkSkyForecast(dictionary: json), "Forecast must contain data.")
        let units = ["units": "si" as AnyObject]
        json["flags"] = units as AnyObject
        XCTAssertNil(DarkSkyForecast(dictionary: json), "Forecast must contain lat. and long.")
        json["latitude"]  = 51.3 as AnyObject
        json["longitude"] = -1.0 as AnyObject
        json["timezone"]  = "Europe/London" as AnyObject
        json["currently"] = [String: AnyObject]() as AnyObject
        print(json)
        XCTAssertNotNil(DarkSkyForecast(dictionary: json), "Forecast can be created with minimal data.")
    }
}
