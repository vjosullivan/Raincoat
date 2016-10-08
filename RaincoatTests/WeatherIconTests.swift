//
//  WeatherIconTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 08/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class WeatherIconTests: XCTestCase {
    
    func testReferenceValues() {
        XCTAssertEqual("\u{f00d}", WeatherIcon.clearDay.iconRef)
        XCTAssertEqual(WeatherIcon.fog.iconRef, "\u{f014}")
        XCTAssertEqual(WeatherIcon.hail.iconRef, "\u{f015}")
        XCTAssertEqual(WeatherIcon.rain.iconRef, "\u{f019}")
        XCTAssertEqual(WeatherIcon.snow.iconRef, "\u{f01b}")
        XCTAssertEqual(WeatherIcon.wind.iconRef, "\u{f050}")
        XCTAssertEqual(WeatherIcon.sleet.iconRef, "\u{f0b5}")
        XCTAssertEqual(WeatherIcon.cloudy.iconRef, "\u{f041}")
        XCTAssertEqual(WeatherIcon.tornado.iconRef, "\u{f056}")
        XCTAssertEqual(WeatherIcon.clearDay.iconRef, "\u{f00d}")
        XCTAssertEqual(WeatherIcon.clearNight.iconRef, "\u{f02e}")
        XCTAssertEqual(WeatherIcon.thunderstorm.iconRef, "\u{f01e}")
        XCTAssertEqual(WeatherIcon.partlyCloudyDay.iconRef, "\u{f002}")
        XCTAssertEqual(WeatherIcon.partlyCloudyNight.iconRef, "\u{f086}")
    }
}
