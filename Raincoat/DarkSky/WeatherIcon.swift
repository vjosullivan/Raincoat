//
//  WeatherIcon.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 08/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum WeatherIcon: String {
    
    case fog = "fog"
    case hail = "hail"
    case rain = "rain"
    case snow = "snow"
    case wind = "wind"
    case sleet = "sleet"
    case cloudy = "cloudy"
    case tornado = "tornado"
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case thunderstorm = "thunderstorm"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    
    var iconRef: String {
        switch self {
        case .fog: return "\u{f014}"
        case .hail: return "\u{f015}"
        case .rain: return "\u{f019}"
        case .snow: return "\u{f01b}"
        case .wind: return "\u{f050}"
        case .sleet: return "\u{f0b5}"
        case .cloudy: return "\u{f041}"
        case .tornado: return "\u{f056}"
        case .clearDay: return "\u{f00d}"
        case .clearNight: return "\u{f02e}"
        case .thunderstorm: return "\u{f01e}"
        case .partlyCloudyDay: return "\u{f002}"
        case .partlyCloudyNight: return "\u{f086}"
        }
    }
}

