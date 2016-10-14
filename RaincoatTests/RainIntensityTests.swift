//
//  RainIntensityTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 14/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class RainIntensityTests: XCTestCase {
    
    func testUSRain() {
        let noRain = Measurement(value: 0.0, unit: UnitSpeed.inchesPerHour)
        let liRain = Measurement(value: 0.05, unit: UnitSpeed.inchesPerHour)
        let moRain = Measurement(value: 0.2, unit: UnitSpeed.inchesPerHour)
        let heRain = Measurement(value: 1.0, unit: UnitSpeed.inchesPerHour)
        let viRain = Measurement(value: 5.0, unit: UnitSpeed.inchesPerHour)
        XCTAssertEqual(RainIntensity.none, RainIntensity(measurement: noRain))
        XCTAssertEqual(RainIntensity.lightRain, RainIntensity(measurement: liRain))
        XCTAssertEqual(RainIntensity.moderateRain, RainIntensity(measurement: moRain))
        XCTAssertEqual(RainIntensity.heavyRain, RainIntensity(measurement: heRain))
        XCTAssertEqual(RainIntensity.violentRain, RainIntensity(measurement: viRain))
    }
    
    func testMetricRain() {
        let noRain = Measurement(value:  0.0, unit: UnitSpeed.millimetersPerHour)
        let liRain = Measurement(value:  1.0, unit: UnitSpeed.millimetersPerHour)
        let moRain = Measurement(value:  5.0, unit: UnitSpeed.millimetersPerHour)
        let heRain = Measurement(value: 25.0, unit: UnitSpeed.millimetersPerHour)
        let viRain = Measurement(value: 75.0, unit: UnitSpeed.millimetersPerHour)
        XCTAssertEqual(RainIntensity.none, RainIntensity(measurement: noRain))
        XCTAssertEqual(RainIntensity.lightRain, RainIntensity(measurement: liRain))
        XCTAssertEqual(RainIntensity.moderateRain, RainIntensity(measurement: moRain))
        XCTAssertEqual(RainIntensity.heavyRain, RainIntensity(measurement: heRain))
        XCTAssertEqual(RainIntensity.violentRain, RainIntensity(measurement: viRain))
    }
    
    func testOtherRain() {
        let noRain = Measurement(value: 0.0, unit: UnitSpeed.milesPerHour)
        let liRain = Measurement(value: 0.1, unit: UnitSpeed.knots)
        XCTAssertEqual(nil, RainIntensity(measurement: noRain))
        XCTAssertEqual(nil, RainIntensity(measurement: liRain))
    }
}
