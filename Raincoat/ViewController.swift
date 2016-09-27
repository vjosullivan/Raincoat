//
//  ViewController.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 20/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let darkSky = DarkSkyClient(location: Location(latitude: 53.3, longitude: -1.0))
        darkSky.fetchForecast{ darkSkyForecast in
            print("Wahey! 4")
            self.update(forecast: darkSkyForecast)
        }
    }
    
    func update(forecast: DarkSkyForecast) {
        print("Wahey! Updating screen for location \(forecast.latitude)N, \(forecast.longitude)W.")
        print("Time: \(forecast.current.time).")
        print("Temperature: \(forecast.current.temperature), (feels like \(forecast.current.apparentTemperature)).")
        location.text = "Latitude: \(forecast.latitude)"
    }
}

