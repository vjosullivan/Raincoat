//
//  MoonIconTests.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 13/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Raincoat

class MoonIconTests: XCTestCase {
    
    func testInvalidPhase() {
        XCTAssertNil(MoonIcon(phase: -0.05), "Phase cannot be negative.")
        XCTAssertNil(MoonIcon(phase:  1.05), "Phase too high.")
    }
    
    func testFace() {
        XCTAssertEqual("\u{f095}", MoonIcon(phase: 0.0)?.face)
        XCTAssertEqual("\u{f09c}", MoonIcon(phase: 0.25)?.face)
        XCTAssertEqual("\u{f0a3}", MoonIcon(phase: 0.5)?.face)
        XCTAssertEqual("\u{f0aa}", MoonIcon(phase: 0.75)?.face)
        XCTAssertEqual("\u{f095}", MoonIcon(phase: 1.0)?.face)
    }
    
    func testShadow() {
        XCTAssertEqual("\u{f0eb}", MoonIcon(phase: 0.0)?.shadow)
        XCTAssertEqual("\u{f0d6}", MoonIcon(phase: 0.25)?.shadow)
        XCTAssertEqual("\u{f0dd}", MoonIcon(phase: 0.5)?.shadow)
        XCTAssertEqual("\u{f0e4}", MoonIcon(phase: 0.75)?.shadow)
        XCTAssertEqual("\u{f0eb}", MoonIcon(phase: 1.0)?.shadow)
    }
}
