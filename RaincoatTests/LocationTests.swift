//
//  LocationTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 20/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class LocationTests: XCTestCase {
    
    func testCreatable() {
        let location = Location(latitude: 5.0, longitude: 7.0)
        XCTAssertNotNil(location)
        XCTAssertEqual(5.0, location.latitude)
        XCTAssertEqual(7.0, location.longitude)
    }
}
