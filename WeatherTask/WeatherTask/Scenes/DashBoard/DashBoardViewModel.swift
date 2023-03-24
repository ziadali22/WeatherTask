//  
//  DashBoardViewModel.swift
//  WeatherTask
//
//  Created by ziad on 22/03/2023.
//

import Foundation
import Networking
import UIWeather

// MARK: DashBoardViewModel
//
class DashBoardViewModel {
    var getCurrentWheatherSuccess: () -> Void = {}
    var weatherData: MainWeather?
    
    var locationText: String {
        return weatherData?.name ?? ""
    }
    var tempratureText: String {
        return String(format: "%.1f",(weatherData?.main?.temp ?? 0.0).kelvinToCelsius) + " °C"
    }
    var weatherDescription: String {
        return "🌤️ " + (weatherData?.weather?[0].description ?? "")
    }
    var feelsLike: String {
        return String(format: "%.1f", (weatherData?.main?.feelsLike ?? 0.0).kelvinToCelsius) + " °C"
    }
    var tempMin: String {
        return String(format: "%.1f", (weatherData?.main?.tempMin ?? 0.0).kelvinToCelsius) + " °C"
    }
    var tempMax: String {
        return String(format: "%.1f", (weatherData?.main?.tempMax ?? 0.0).kelvinToCelsius) + " °C"
    }
    var humidity: String {
        return String(weatherData?.main?.humidity ?? 0) + "%"
    }
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    var day: String {
        return dateFormatter.string(from: weatherData?.dt ?? Date())
    }
}

// MARK: DashBoardViewModel

extension DashBoardViewModel: DashBoardViewModelInput {

}

// MARK: DashBoardViewModelOutput
//
extension DashBoardViewModel: DashBoardViewModelOutput {
    
    func getWheatherInfo(latitude: Double, longitude: Double, completion: @escaping () -> Void) {
        let network = AlamofireNetwork()
        let currentWheatherRemote = WeatherInfoRemote(network: network)
        currentWheatherRemote.getWeatherInfo(lat: latitude, long: longitude) { result in
            switch result {
            case .success(let data):
                self.weatherData = data
                self.getCurrentWheatherSuccess = completion
                self.getCurrentWheatherSuccess()
            case .failure(let error):
                print("getWheatherInfo: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: Private Handlers
//
private extension DashBoardViewModel {

}
