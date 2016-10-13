//
//  DarkSkyClient.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 20/09/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

public typealias DarkSkyHandler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

struct DarkSkyClient {
    
    fileprivate static let darkSkyUrl = "https://api.darksky.net/forecast/"
    fileprivate static let darkSkyKey = "7f7075d90bf85644daa070b898a10132"
    fileprivate static let ukSuffix   = "units=uk2"
    
    fileprivate let url: URL
    
    
    /// Initialises a `DarkSkyClient` with a set location.
    ///
    /// - parameter location: A location on the Earth's surface.
    /// - returns: A `DarkSkyClient` dedicated to the suppled location.
    ///
    init(location: Location) {
        url = URL(string: DarkSkyClient.darkSkyUrl + DarkSkyClient.darkSkyKey + "/\(location.latitude),\(location.longitude)?\(DarkSkyClient.ukSuffix)")!
    }
    
    
    /// Initialiser: Utilises "dependency injection" to initialise the client with a predefined URL.
    ///
    /// - parameter url: A URL (usually containing test data).
    /// - returns: A `DarkSkyClient` initialised with test data.
    ///
    public init(url: URL) {
        self.url = url
    }

    func fetchData(completionHandler handler: @escaping DarkSkyHandler) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: handler)
        task.resume()
    }
    
    func fetchForecast(completionHandler: @escaping (DarkSkyForecast) -> Void) {
        fetchData{(data, response, error) in
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
            if let forecast = DarkSkyForecast(dictionary: json) {
                completionHandler(forecast)
            }
        }
    }
}
