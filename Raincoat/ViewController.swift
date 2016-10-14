//
//  ViewController.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 20/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var forecastTimestamp: UILabel!
    @IBOutlet weak var sunTimes: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var apparentTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
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
    @IBOutlet weak var moonIconLabel: UILabel!
    
    private var locationCoordinates: Location? = nil
    private var locationController: LocationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationController = LocationController(delegate: self)
        locationController?.requestLocation()
    }
    
    func update(using forecast: DarkSkyForecast) {
        print("\n\n\(forecast)\n\n")
        location.text = "\(abs(round(forecast.latitude.value * 10) / 10))°\(forecast.latitude.value >= 0 ? "N" : "S"), \(abs(round(forecast.longitude.value * 10) / 10))°\(forecast.longitude.value >= 0 ? "E" : "W")"
        sunTimes.text = "Sunrise: 07:34 ⋅ Sunset: 19:35"
        temperature.text = "⋅"
        apparentTemperature.text = "⋅"
        maxTemperature.text = "Min: 8°C ⋅ Max: 19°C"
        dewPoint.text = "⋅"
        cloudLabel.text = "⋅"
        pressure.text = "⋅"
        humidityLabel.text = "⋅"
        moonLabel.text = "(No lunar data.)"
        summaryLabel.text = "Summary: Weather expected"
        rainLabel.text = "No precipitation"
        iconLabel.text = "⋅"
        guard let the = forecast.current else {
            return
        }
        if let sunrise = the.sunriseTime, let sunset = the.sunsetTime {
            sunTimes.text = "Sunrise ⋅ Sunset: \(local(time: sunrise, formattedAs: "HH:mm")) ⋅ \(local(time: sunset, formattedAs: "HH:mm"))"
        }
        forecastTimestamp.text = "Conditions as at \(local(time: the.time, formattedAs: "HH:mm"))"
        if let temp = the.temperature {
            temperature.text = "Temperature: \(Int(temp.value))\(temp.unit.symbol)"
        }
        if let temp = the.apparentTemperature {
            apparentTemperature.text = "Feels like: \(Int(temp.value))\(temp.unit.symbol)"
        }
        if let maxTemp = the.temperatureMax, let minTemp = the.temperatureMin {
            maxTemperature.text = "Max: \(maxTemp) ⋅ Min: \(minTemp)"
        }
        if let value = the.dewPoint {
            dewPoint.text = "\(value.value >= 0 ? "Dew" : "Frost") point: \(value)"
        }
        if let value = the.pressure {
            pressure.text = "Pressure: \(Int(value.value)) \(value.unit.symbol)"
        }
        if let value = the.humidity {
            humidityLabel.text = "Humidity: \(Int(value * 100))%"
        }
        if let cloudValue = the.cloudCover {
            cloudLabel.text = "Cloud cover: \(Int(cloudValue * 100.0))%"
        }
        if let moonPhase = the.moonPhase {
            moonLabel.text = MoonIcon(phase: moonPhase)!.face
        } else {
            moonIconLabel.text = MoonIcon(phase: 0.9)!.face
        }
        if let summary = the.summary {
            summaryLabel.text = "Summary: \(summary)"
        }
        if let speed = the.windSpeed {
            windLabel.text = "Wind: \(Int(round(speed.value)))\(speed.unit.symbol)"
            if let bearing = the.windBearing {
                windLabel.text = windLabel.text! + " from the \(Compass(degrees: bearing.value).rawValue)"
            }
        }
        if let precipType = the.precipType {
            rainLabel.text = "Precipitation type: \(precipType)"
        }
        if let iconText = the.icon {
            iconLabel.text = "Icon: \"\(iconText)\""
            weatherIconLabel.text = WeatherIcon(rawValue: iconText)?.iconRef ?? "?!"
        }
    }
    
    func local(time: Date, formattedAs: String) -> String {
        // create dateFormatter with UTC time format
        let formatter = DateFormatter()
        formatter.dateFormat = formattedAs
        formatter.timeZone = TimeZone.current
        return formatter.string(from: time)
    }
}

extension ViewController: LocationControllerDelegate {
    
    func location(controller: LocationController, didUpdateLocation location: Location) {
        print("VOS08")
        let darkSky = DarkSkyClient(location: location)
        darkSky.fetchForecast{ darkSkyForecast in
            DispatchQueue.main.async {
                self.update(using: darkSkyForecast)
            }
        }
    }
    
    func location(controller: LocationController, didFailWithError error: Error) {
        print("VOS09")
//        DispatchQueue.main.async {
//            self.updateView(forecast: nilForecast)
//        }
        let alertController = UIAlertController(title: "Current Weather", message: "No weather forecast available at the moment.\n\n\(error)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

