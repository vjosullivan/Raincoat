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
    
    @IBOutlet weak var forecastTimestamp: UILabel!
    @IBOutlet weak var sunTimes: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var apparentTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var dewPoint: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var moonLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
 
    @IBOutlet weak var weatherIconLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\n\n\n")
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        print("\n\n\n\n")
        
        let darkSky = DarkSkyClient(location: Location(latitude: 51.5, longitude: -0.5))
        darkSky.fetchForecast{ darkSkyForecast in
            print("Wahey! 4")
            DispatchQueue.main.async {
                self.update(forecast: darkSkyForecast)
            }
        }
    }
    
    func update(forecast: DarkSkyForecast) {
        print("\n\n\(forecast)\n\n")
        location.text = "\(abs(forecast.latitude.value))°\(forecast.latitude.value >= 0 ? "N" : "S"), \(abs(forecast.longitude.value))°\(forecast.longitude.value >= 0 ? "E" : "W")"
        if let sunrise = forecast.current?.sunriseTime {
            sunTimes.text = "Sunrise ⋅ Sunset: \(local(time: sunrise, formattedAs: "HH:mm")) ⋅ \(local(time: (forecast.current?.sunsetTime!)!, formattedAs: "HH:mm"))"
        } else {
            sunTimes.text = "⋅"
        }
        forecastTimestamp.text = "Conditions at \(local(time: (forecast.current?.time)!, formattedAs: "HH:mm"))"
        if let temp = forecast.current?.temperature {
            temperature.text = "Temperature: \(Int(temp.value))\(temp.unit.symbol)"
        } else {
            temperature.text = "⋅"
        }
        if let temp = forecast.current?.apparentTemperature {
            apparentTemperature.text = "Feels like: \(Int(temp.value))\(temp.unit.symbol)"
        } else {
            apparentTemperature.text = "⋅"
        }
        if let maxTemp = forecast.current?.temperatureMax {
            maxTemperature.text = "Max today: \(maxTemp)"
        } else {
            maxTemperature.text = "⋅"
        }
        if let minTemp = forecast.current?.temperatureMin {
            minTemperature.text = "Min today: \(minTemp)"
        } else {
            minTemperature.text = "⋅"
        }
        if let value = forecast.current?.dewPoint {
            dewPoint.text = "\(value.value >= 0 ? "Dew" : "Frost") point: \(value)"
        } else {
            dewPoint.text = "⋅"
        }
        if let value = forecast.current?.pressure {
            pressure.text = "Pressure: \(Int(value.value)) \(value.unit.symbol)"
        } else {
            pressure.text = "⋅"
        }
        if let value = forecast.current?.humidity {
            humidityLabel.text = "Humidity: \(Int(value * 100))%"
        } else {
            humidityLabel.text = "⋅"
        }
        cloudLabel.text = "Cloud cover: \(Int((forecast.current?.cloudCover!)! * 100.0))%"
        if let moonPhase = forecast.current?.moonPhase {
            moonLabel.text = "Moon: \(moonPhase)"
        } else {
            moonLabel.text = "⋅"
        }
        summaryLabel.text = forecast.current?.summary!
        if let speed = forecast.current?.windSpeed {
            windLabel.text = "Wind: \(speed)"
            if let bearing = forecast.current?.windBearing {
                windLabel.text = windLabel.text! + " at \(bearing)"
            }
        }
        if let precipType = forecast.current?.precipType {
            rainLabel.text = precipType
        } else {
            rainLabel.text = "No precipitation"
        }
        if let iconText = forecast.current?.icon {
            iconLabel.text = "\(iconText)"
            weatherIconLabel.text = weatherIcon(name:iconText)
        } else {
            iconLabel.text = "⋅"
        }
    }
    
    private func weatherIcon(name: String) -> String {
        var iconRef = ""
        switch name {
        case "clear-day":
            iconRef = "\u{f00d}"
        case "clear-night":
            iconRef = "\u{f02e}"
        case "rain":
            iconRef = "\u{f019}"
        case "snow":
            iconRef = "\u{f01b}"
        case "sleet":
            iconRef = "\u{f0b5}"
        case "wind":
            iconRef = "\u{f050}"
        case "fog":
            iconRef = "\u{f014}"
        case "cloudy":
            iconRef = "\u{f041}"
        case "partly-cloudy-day":
            iconRef = "\u{f002}"
        case "partly-cloudy-night":
            iconRef = "\u{f086}"
        case "hail":
            iconRef = "\u{f015}"
        case "thunderstorm":
            iconRef = "\u{f01e}"
        case "tornado":
            iconRef = "\u{f056}"
        default:
            iconRef = ""
        }
        return iconRef
    }
    
    func local(time: Date, formattedAs: String) -> String {
        // create dateFormatter with UTC time format
        let formatter = DateFormatter()
        formatter.dateFormat = formattedAs
        formatter.timeZone = TimeZone.current
        return formatter.string(from: time)
    }
}

