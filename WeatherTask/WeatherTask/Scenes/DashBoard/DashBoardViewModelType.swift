//  
//  DashBoardViewModelType.swift
//  WeatherTask
//
//  Created by ziad on 22/03/2023.
//

import Foundation
import Networking

/// DashBoard Input & Output
///
typealias DashBoardViewModelType = DashBoardViewModelInput & DashBoardViewModelOutput

/// DashBoard ViewModel Input
///
protocol DashBoardViewModelInput {
  
}

/// DashBoard ViewModel Output
///
protocol DashBoardViewModelOutput {

    func getWheatherInfo(latitude: Double, longitude: Double, completion: @escaping () -> Void)
    var locationText: String {get}
    var tempratureText: String {get}
    var weatherDescription: String {get}
    var feelsLike: String {get}
    var tempMin: String {get}
    var tempMax: String {get}
    var day: String {get}
    var humidity: String {get}
}
