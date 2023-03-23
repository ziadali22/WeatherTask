//
//  WeatherForecastRemote.swift
//  
//
//  Created by ziad on 22/03/2023.
//

import Foundation

/// Protocol for `WeatherForecastRemote` mainly used for mocking.
///
public protocol WeatherForecastRemoteProtcol {
    func getWeatherForecast(lat: Double, long: Double, completion: @escaping (Result<ForecastWeather, Error>) -> Void)
}

/// Forecast: Remote Endpoints
///

public class WeatherForecastRemote: Remote, WeatherForecastRemoteProtcol {
    
    /// Load all aviilable forcasts
    ///
    
    public func getWeatherForecast(lat: Double, long: Double, completion: @escaping (Result<ForecastWeather, Error>) -> Void) {
        
        let path = "/data/2.5/forecast"
        let parameters = ["lat": lat, "lon": long]
        
        let request = WeatherApiRequest(method: .get, path: path, parameters: parameters)
        enqueue(request, completion: completion)
    }
}
