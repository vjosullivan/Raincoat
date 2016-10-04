//
//  DetailedForecast.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 01/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

/// A detailed forecast is basically a collection of `DataPoint`s, with a covering summary and icon.
struct DetailedForecast {
    let summary: String?
    let icon: String?
    
    let data: [DataPoint]?
}

extension DetailedForecast {
    
    init?(dictionary: [String: AnyObject]?, forecastUnits: DarkSkyUnits) {
        guard let dictionary = dictionary else {
            return nil
        }
        summary = dictionary["summary"] as? String
        icon    = dictionary["icon"] as? String
        
        data = [DataPoint]()
        if let dataList = dictionary["data"] as? [[String: AnyObject]] {
            for dataPoint in dataList {
                if let detail = DataPoint(dictionary: dataPoint, forecastUnits: forecastUnits) {
                    data?.append(detail)
                }
            }
        }
        if summary == nil && icon == nil && data?.count == 0 {
            return nil
        }
    }
}
