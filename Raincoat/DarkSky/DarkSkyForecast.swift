//
//  DarkSkyForecast.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 23/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct DarkSkyForecast {
    
    let forecastUnits: DarkSkyUnits

    let latitude: Measurement<UnitAngle>
    let longitude: Measurement<UnitAngle>
    
    let timeZone: String
    
    let current: DataPoint
}
