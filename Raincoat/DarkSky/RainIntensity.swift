//
//  RainIntensity.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 14/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum RainIntensity {
    case none
    case lightRain    //  < 0.1 in/hr or  2.5 mm/hr
    case moderateRain //  < 0.3 in/hr or  7.6 mm/hr
    case heavyRain    //  < 2.0 in/hr or 50.0 mm/hr
    case violentRain  // >= 2.0 in/hr or 50.0 mm/hr
    
    init?(measurement: Measurement<UnitSpeed>) {
        switch measurement.unit {
        case DarkSkyUnits.us.rainIntensity:
            switch measurement.value {
            case 0.0:
                self = .none
            case 0.0..<0.1:
                self = .lightRain
            case 0.1..<0.3:
                self = .moderateRain
            case 0.3..<2.0:
                self = .heavyRain
            default:
                self = .violentRain
            }
        case DarkSkyUnits.si.rainIntensity, DarkSkyUnits.ca.rainIntensity, DarkSkyUnits.uk2.rainIntensity:
            switch measurement.value {
            case 0.0:
                self = .none
            case 0.0..<2.5:
                self = .lightRain
            case 2.5..<10.0:
                self = .moderateRain
            case 10.0..<50.0:
                self = .heavyRain
            default:
                self = .violentRain
            }
        default:
            return nil
        }
    }
}

