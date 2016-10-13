//
//  DarkSkyUnitsTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 27/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class DarkSkyUnitsTests: XCTestCase {
    
    func testFromString() {
        XCTAssertEqual(DarkSkyUnits.ca, DarkSkyUnits.from(string: "ca"))
        XCTAssertEqual(DarkSkyUnits.si, DarkSkyUnits.from(string: "si"))
        XCTAssertEqual(DarkSkyUnits.uk2, DarkSkyUnits.from(string: "uk2"))
        XCTAssertEqual(DarkSkyUnits.us, DarkSkyUnits.from(string: "us"))
        XCTAssertEqual(DarkSkyUnits.us, DarkSkyUnits.from(string: "xx"))
    }
    
    func testSIUnits() {
        
        let siUnits = DarkSkyUnits.si
        
        XCTAssertEqual(UnitPressure.hectopascals, siUnits.airPressure, "Metric air pressure should be in hectopascals.")
        XCTAssertEqual(UnitAngle.degrees, siUnits.angle, "Metric angle should be in degrees.")
        XCTAssertEqual(UnitLength.kilometers, siUnits.distance, "Metric distance should be in kilometres.")
        XCTAssertEqual(UnitSpeed.millimetersPerHour, siUnits.rainIntensity, "Metric rain intensity should be in mm/Hr.")
        XCTAssertEqual(UnitTemperature.celsius, siUnits.temperature, "Metric temperature should be in celsius.")
        XCTAssertEqual(UnitSpeed.metersPerSecond, siUnits.windSpeed, "Metric wind speed should be in m/s.")
        XCTAssertEqual(UnitLength.millimeters, siUnits.accumulation, "Metric accumulation should be in mm.")
    }
    
    func testCAUnits() {
        
        let caUnits = DarkSkyUnits.ca
        
        XCTAssertEqual(UnitPressure.hectopascals, caUnits.airPressure, "Canadian air pressure should be in hectopascals.")
        XCTAssertEqual(UnitAngle.degrees, caUnits.angle, "Canadian angle should be in degrees.")
        XCTAssertEqual(UnitLength.kilometers, caUnits.distance, "Canadian distance should be in kilometres.")
        XCTAssertEqual(UnitSpeed.millimetersPerHour, caUnits.rainIntensity, "Canadian rain intensity should be in mm/Hr.")
        XCTAssertEqual(UnitTemperature.celsius, caUnits.temperature, "Canadian temperature should be in celsius.")
        XCTAssertEqual(UnitSpeed.kilometersPerHour, caUnits.windSpeed, "Canadian wind speed should be in km/h.")
        XCTAssertEqual(UnitLength.millimeters, caUnits.accumulation, "Canadian accumulation should be in mm.")
    }
    
    func testUKUnits() {
        
        let ukUnits = DarkSkyUnits.uk2
        
        XCTAssertEqual(UnitPressure.hectopascals, ukUnits.airPressure, "UK air pressure should be in hectopascals.")
        XCTAssertEqual(UnitAngle.degrees, ukUnits.angle, "UK angle should be in degrees.")
        XCTAssertEqual(UnitLength.miles, ukUnits.distance, "UK distance should be in miles.")
        XCTAssertEqual(UnitSpeed.millimetersPerHour, ukUnits.rainIntensity, "UK rain intensity should be in mm/Hr.")
        XCTAssertEqual(UnitTemperature.celsius, ukUnits.temperature, "UK temperature should be in celsius.")
        XCTAssertEqual(UnitSpeed.milesPerHour, ukUnits.windSpeed, "UK wind speed should be in mph.")
        XCTAssertEqual(UnitLength.millimeters, ukUnits.accumulation, "UK accumulation should be in mm.")
    }
    
    func testUSUnits() {
        
        let usUnits = DarkSkyUnits.us
        
        XCTAssertEqual(UnitPressure.millibars, usUnits.airPressure, "US air pressure should be in millibars.")
        XCTAssertEqual(UnitAngle.degrees, usUnits.angle, "US angle should be in degrees.")
        XCTAssertEqual(UnitLength.miles, usUnits.distance, "US distance should be in miles.")
        XCTAssertEqual(UnitSpeed.inchesPerHour, usUnits.rainIntensity, "US rain intensity should be in in/Hr.")
        XCTAssertEqual(UnitTemperature.fahrenheit, usUnits.temperature, "US temperature should be in fahrenheit.")
        XCTAssertEqual(UnitSpeed.milesPerHour, usUnits.windSpeed, "US wind speed should be in mph.")
        XCTAssertEqual(UnitLength.inches, usUnits.accumulation, "US accumulation should be in inches.")
    }
}
