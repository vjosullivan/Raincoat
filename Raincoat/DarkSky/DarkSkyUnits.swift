//
//  DarkSkyUnits.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 25/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

extension UnitSpeed {
    /// Custom measurement metric speed for railfall intensity.
    @nonobjc static let millimetersPerHour = UnitSpeed(symbol: "mm/h", converter: UnitConverterLinear(coefficient: 0.0000002777778))
    /// Custom measurement imperial speed for railfall intensity.
    @nonobjc static let inchesPerHour      = UnitSpeed(symbol: "in/h", converter: UnitConverterLinear(coefficient: 0.000007055552))
}

enum DarkSkyUnits {
    case uk2
    case ca
    case us
    case si
    
    
    /// Returns a `UnitsFamily` value derived from the supplied `String`.
    ///
    /// - parameter string: A `DarkSkyUnits` identifier.
    ///
    /// - returns: A `DarkSkyUnits` value.
    ///
    static func from(string: String) -> DarkSkyUnits {
        switch string {
        case "ca":
            return .ca
        case "si":
            return .si
        case "uk2":
            return .uk2
        default:
            return .us
        }
    }
    
    var temperature: UnitTemperature {
        switch self {
        case .si, .ca, .uk2:
            return .celsius
        case .us:
            return .fahrenheit
        }
    }
    
    var angle: UnitAngle {
        return .degrees
    }
    
    var rainIntensity: UnitSpeed {
        switch self {
        case .si, .ca, .uk2:
            return .millimetersPerHour
        case .us:
            return .inchesPerHour
        }
    }
    
    var airPressure: UnitPressure {
        switch self {
        case .si, .ca, .uk2:
            return .hectopascals
        case .us:
            return .millibars
        }
    }
    
    ///  The units used for measuring wind speed.
    var windSpeed: UnitSpeed {
        switch self {
        case .si:
            return .metersPerSecond
        case .ca:
            return .kilometersPerHour
        case .uk2:
            return .milesPerHour
        case .us:
            return .milesPerHour
        }
    }
    
    var distance: UnitLength {
        switch self {
        case .si, .ca:
            return .kilometers
        case .uk2, .us:
            return .miles
        }
    }
    
    var accumulation: UnitLength {
        switch self {
        case .si, .ca, .uk2:
            return .millimeters
        case .us:
            return .inches
        }
    }
}
