//
//  Weather.swift
//  
//
//  Created by ziad on 22/03/2023.
//
import Foundation


public struct MainWeather: Codable {
    public let coord: Coord?
    public let weather: [Weather]?
    public let base: String?
    public let main: Main?
    public let visibility: Int?
    public let wind: Wind?
    public let rain: Rain?
    public let clouds: Clouds?
    public let dt: Int?
    public let sys: Sys?
    public let timezone, id: Int?
    public let name: String?
    public let cod: Int?
}

// MARK: - Clouds
public struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
public struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
public struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    public let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
public struct Rain: Codable {
    let the1H: Double?
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
        case the3H = "3h"
    }
}

// MARK: - Sys
public struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
    let pod: String?
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int?
    public let main, description, icon: String?
    public var weatherIconUrl: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon ?? "")@2x.png"
        return URL(string: urlString)!
    }
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double?
    public let deg: Int?
    public let gust: Double?
}
