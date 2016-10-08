//
//  DetailedForecastTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 08/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class DetailedForecastTests: XCTestCase {
   
    func testNilDictionary() {
        XCTAssertNil(DetailedForecast(dictionary: nil, forecastUnits: DarkSkyUnits.si))
    }
    func testEmptyDictionary() {
        let emptyDictionary = [String: AnyObject]()
        XCTAssertNil(DetailedForecast(dictionary: emptyDictionary, forecastUnits: DarkSkyUnits.si))
    }
    func testDictionaryWithHeadings() {
        let dictionary: [String: AnyObject] = ["summary": "sunny" as AnyObject, "icon": "clear-day" as AnyObject]
        let forecast = DetailedForecast(dictionary: dictionary, forecastUnits: DarkSkyUnits.si)
        XCTAssertNotNil(forecast)
        XCTAssertEqual("sunny", forecast?.summary)
        XCTAssertEqual("clear-day", forecast?.icon)
    }
    func testDetails() {
        var dictionary: [String: AnyObject] = ["summary": "sunny" as AnyObject, "icon": "clear-day" as AnyObject]
        let detail1: [String: AnyObject]    = ["time": 1476489601 as AnyObject, "cloudCover": 0.5 as AnyObject]
        let detail2: [String: AnyObject]    = ["time": 1476489602 as AnyObject, "cloudCover": 1 as AnyObject]
        dictionary["data"] = [detail1, detail2] as AnyObject
        let forecast = DetailedForecast(dictionary: dictionary, forecastUnits: DarkSkyUnits.si)
        XCTAssertNotNil(forecast)
        XCTAssertEqual("sunny", forecast?.summary)
        XCTAssertEqual("clear-day", forecast?.icon)
        XCTAssertEqual(2, forecast?.dataPoints?.count)
    }
}
