//
//  WeatherInfoRemote.swift
//  
//
//  Created by ziad on 22/03/2023.
//

import Foundation

/// Protocol for `WeatherInfoRemote` mainly used for mocking.
///
public protocol WeatherInfoRemoteProtocol {
    func getWeatherInfo(lat: Double, long: Double, completion: @escaping (Result<MainWeather, Error>) -> Void)
}

/// Current Wheather: Remote Endpoints
///
public class WeatherInfoRemote: Remote, WeatherInfoRemoteProtocol {
    
    /// Loads all current wheather data
    ///
    
    public func getWeatherInfo(lat: Double, long: Double, completion: @escaping (Result<MainWeather, Error>) -> Void) {
        
        let path = "/data/2.5/weather"
        let parameters = ["lat": lat, "lon": long]
        
        let request = WeatherApiRequest(method: .get, path: path, parameters: parameters)
        enqueue(request, completion: completion)
    }
}
