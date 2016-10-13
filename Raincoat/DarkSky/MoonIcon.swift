//
//  MoonIcon.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 09/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct MoonIcon {

    private let phase: Double
    
    init?(phase: Double) {
        guard phase >= 0.0 && phase <= 1.0 else {
            return nil
        }
        self.phase = phase
    }

    /// Converts a moon phase in the coundituous range 0.0 (inc) to 1.0 (exc)
    /// into the integer range 0..<28.  The integer range is off set by 1 / 28
    /// so that (-(1/28) to +(1/28) is mapped to 0, etc.
    ///
    /// - parameter phase: The moon phase where 0.0 ±(½/28) is a new moon,
    ///             0.5 ±(½/28) is a full moon, etc.
    ///
    /// - returns: The moon phase in the range 0..<28 where 0 is a new moon, 14 is a new moon, etc.
    private func moonDay(phase: Double) -> Int {
        return Int(phase * 28.0 + 0.5) % 28
    }

    var face: String {
        let day:Int = 0xf095 + moonDay(phase: phase)
        return String(Character(UnicodeScalar(day)!))
    }
    
    var shadow: String {
        let dayOf28 = moonDay(phase: phase)
        // The icon for day 0 is not in the same sequence as the other icons.
        let day = dayOf28 == 0 ? 0xf0eb : 0xf0cf + moonDay(phase: phase)
        return String(Character(UnicodeScalar(day)!))
    }
}

