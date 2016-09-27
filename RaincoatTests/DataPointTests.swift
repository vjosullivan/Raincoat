//
//  DataPointTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 26/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class DataPointTests: XCTestCase {
    
    func testInitAllValues() {
        let json: [String: AnyObject] = [
            "time": 140_000_000 as AnyObject,
            "apparentTemperature": 13.5 as AnyObject,
            "apparentTemperatureMax": 12.3 as AnyObject,
            "apparentTemperatureMin": 9.8 as AnyObject,
            "apparentTemperatureMaxTime": 145_000_000 as AnyObject,
            "apparentTemperatureMinTime": 146_000_000 as AnyObject,
            "cloudCover": 0.25 as AnyObject,
            "dewPoint": 5.7 as AnyObject,
            "humidity": 0.75 as AnyObject,
            "icon": "rain" as AnyObject,
            "moonPhase": 0.67 as AnyObject,
            "nearestStormBearing": 123.4 as AnyObject,
            "nearestStormDistance": 56.7 as AnyObject,
            "ozone": 567.8 as AnyObject,
            "precipAccumulation": 2.5 as AnyObject,
            "precipIntensity": 1.25 as AnyObject,
            "precipIntensityMax": 1.75 as AnyObject,
            "precipIntensityMaxTime": 150_000_000 as AnyObject,
            "precipProbability": 0.55 as AnyObject,
            "precipType": "sleet" as AnyObject,
            "pressure": 23.5 as AnyObject,
            "summary": "fine" as AnyObject,
            "sunriseTime": 147_123_456 as AnyObject,
            "sunsetTime": 147_654_321 as AnyObject,
            "temperature": 13.5 as AnyObject,
            "temperatureMax": 12.3 as AnyObject,
            "temperatureMin": 9.8 as AnyObject,
            "temperatureMaxTime": 145_000_000 as AnyObject,
            "temperatureMinTime": 146_000_000 as AnyObject,
            "visibility": 5.5 as AnyObject,
            "windBearing": 43.2 as AnyObject,
            "windSpeed": 14.5 as AnyObject]

        let dataPoint = DataPoint(dictionary: json, forecastUnits: DarkSkyUnits.si)!
        XCTAssertEqual(Date(timeIntervalSince1970: 140_000_000), dataPoint.time)
        
        XCTAssertEqual(Measurement(value: 13.5, unit: UnitTemperature.celsius), dataPoint.apparentTemperature!)
        XCTAssertEqual(Measurement(value: 12.3, unit: UnitTemperature.celsius), dataPoint.apparentTemperatureMax!)
        XCTAssertEqual(Measurement(value:  9.8, unit: UnitTemperature.celsius), dataPoint.apparentTemperatureMin!)
        XCTAssertEqual(Date(timeIntervalSince1970: 145_000_000), dataPoint.apparentTemperatureMaxTime!)
        XCTAssertEqual(Date(timeIntervalSince1970: 146_000_000), dataPoint.apparentTemperatureMinTime!)

        XCTAssertEqual(0.25, dataPoint.cloudCover!)
        XCTAssertEqual(Measurement(value: 5.7, unit: UnitTemperature.celsius), dataPoint.dewPoint!)
        XCTAssertEqual(0.75, dataPoint.humidity!)
        XCTAssertEqual("rain", dataPoint.icon!)
        XCTAssertEqual(0.67, dataPoint.moonPhase!)
        
        XCTAssertEqual(Measurement(value: 123.4, unit: UnitAngle.degrees), dataPoint.nearestStormBearing!)
        XCTAssertEqual(Measurement(value:  56.7, unit: UnitLength.kilometers), dataPoint.nearestStormDistance!)
        
        XCTAssertEqual(567.8, dataPoint.ozone)
        
        XCTAssertEqual(Measurement(value: 2.5,  unit: UnitLength.millimeters), dataPoint.precipAccumulation!)
        XCTAssertEqual(Measurement(value: 1.25, unit: UnitSpeed.millimetersPerHour), dataPoint.precipIntensity!)
        XCTAssertEqual(Measurement(value: 1.75, unit: UnitSpeed.millimetersPerHour), dataPoint.precipIntensityMax!)
        XCTAssertEqual(Date(timeIntervalSince1970: 150_000_000), dataPoint.precipIntensityMaxTime!)
        XCTAssertEqual(0.55, dataPoint.precipProbability!)
        XCTAssertEqual("sleet", dataPoint.precipType!)
        
        XCTAssertEqual(Measurement(value: 23.5, unit: UnitPressure.hectopascals), dataPoint.pressure!)
        
        XCTAssertEqual("fine", dataPoint.summary!)
        
        XCTAssertEqual(Date(timeIntervalSince1970: 147_123_456), dataPoint.sunriseTime!)
        XCTAssertEqual(Date(timeIntervalSince1970: 147_654_321), dataPoint.sunsetTime!)
        
        XCTAssertEqual(Measurement(value: 13.5, unit: UnitTemperature.celsius), dataPoint.temperature!)
        XCTAssertEqual(Measurement(value: 12.3, unit: UnitTemperature.celsius), dataPoint.temperatureMax!)
        XCTAssertEqual(Measurement(value:  9.8, unit: UnitTemperature.celsius), dataPoint.temperatureMin!)
        XCTAssertEqual(Date(timeIntervalSince1970: 145_000_000), dataPoint.temperatureMaxTime!)
        XCTAssertEqual(Date(timeIntervalSince1970: 146_000_000), dataPoint.temperatureMinTime!)
        
        XCTAssertEqual(Measurement(value:  5.5, unit: UnitLength.kilometers), dataPoint.visibility!)
        XCTAssertEqual(Measurement(value: 43.2, unit: UnitAngle.degrees), dataPoint.windBearing!)
        XCTAssertEqual(Measurement(value: 14.5, unit: UnitSpeed.metersPerSecond), dataPoint.windSpeed!)
    }
    
    func testInitNoOptionalValues() {
        let json: [String: AnyObject] = ["time": 140_000_000 as AnyObject]
        let units = DarkSkyUnits.si
        let dataPoint = DataPoint(dictionary: json, forecastUnits: units)!
        XCTAssertEqual(Date(timeIntervalSince1970: 140_000_000), dataPoint.time)

        XCTAssertNil(dataPoint.apparentTemperature)
        XCTAssertNil(dataPoint.apparentTemperatureMax)
        XCTAssertNil(dataPoint.apparentTemperatureMin)
        XCTAssertNil(dataPoint.apparentTemperatureMaxTime)
        XCTAssertNil(dataPoint.apparentTemperatureMinTime)
        
        XCTAssertNil(dataPoint.cloudCover)
        XCTAssertNil(dataPoint.dewPoint)
        XCTAssertNil(dataPoint.humidity)
        XCTAssertNil(dataPoint.icon)
        XCTAssertNil(dataPoint.moonPhase)
        
        XCTAssertNil(dataPoint.nearestStormBearing)
        XCTAssertNil(dataPoint.nearestStormDistance)
        
        XCTAssertNil(dataPoint.ozone)
        
        XCTAssertNil(dataPoint.precipAccumulation)
        XCTAssertNil(dataPoint.precipIntensity)
        XCTAssertNil(dataPoint.precipIntensityMax)
        XCTAssertNil(dataPoint.precipIntensityMaxTime)
        XCTAssertNil(dataPoint.precipProbability)
        XCTAssertNil(dataPoint.precipType)
        
        XCTAssertNil(dataPoint.pressure)
        
        XCTAssertNil(dataPoint.summary)
        
        XCTAssertNil(dataPoint.sunriseTime)
        XCTAssertNil(dataPoint.sunsetTime)
        
        XCTAssertNil(dataPoint.temperature)
        XCTAssertNil(dataPoint.temperatureMax)
        XCTAssertNil(dataPoint.temperatureMin)
        XCTAssertNil(dataPoint.temperatureMaxTime)
        XCTAssertNil(dataPoint.temperatureMinTime)
        
        XCTAssertNil(dataPoint.visibility)
        XCTAssertNil(dataPoint.windBearing)
        XCTAssertNil(dataPoint.windSpeed)
}
    
    func testInitNoTime() {
        let json: [String: AnyObject] = ["noTime": 140_000_000 as AnyObject]
        let units = DarkSkyUnits.si
        let dataPoint = DataPoint(dictionary: json, forecastUnits: units)
        XCTAssertNil(dataPoint)
    }
}
