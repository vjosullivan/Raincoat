//
//  DarkSkyForecastInit.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 23/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

extension DarkSkyForecast {
    
    init(dictionary: [String: AnyObject]) {
        
        forecastUnits = DarkSkyUnits.from(string: dictionary["flags"]?["units"] as! String)

        latitude  = Measurement(value: dictionary["latitude"] as! Double, unit: forecastUnits.angle())
        longitude = Measurement(value: dictionary["longitude"] as! Double, unit: forecastUnits.angle())
        
        timeZone = dictionary["timezone"] as! String
        
        current = DataPoint(dictionary: dictionary["currently"] as! [String: AnyObject], forecastUnits: forecastUnits)!
    }
}
