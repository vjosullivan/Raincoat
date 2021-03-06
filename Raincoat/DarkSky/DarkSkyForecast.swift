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
    
    let current: DataPoint?
    
    let minutely: DetailedForecast?
    let hourly:   DetailedForecast?
    let daily:    DetailedForecast?
    
    var today: DataPoint? {
        return daily?.dataPoints?[0]
    }
    
//    lazy var temperatureRise: Double? = {
//        if let currentTemperature = self.current?.apparentTemperature?.value,
//            let oneHourTemperature = self.hourly?.dataPoints?[0].apparentTemperature?.value {
//            return oneHourTemperature - currentTemperature
//        }
//        return nil
//    }()
    
//    var precipIntensityArray: [Double]? {
//        var array = [Double]()
//        if let minutes = minutely?.dataPoints {
//            for data in minutes {
//                if let intensity = data.precipIntensity?.value {
//                    array.append(intensity)
//                } else {
//                    array.append(0.0)
//                }
//            }
//        }
//        return array.count > 0 ? array : nil
//    }
}
