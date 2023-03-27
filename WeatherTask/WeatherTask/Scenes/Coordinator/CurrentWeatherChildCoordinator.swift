//
//  CurrentWeatherChildCoordinator.swift
//  WeatherTask
//
//  Created by ziad on 27/03/2023.
//

import UIKit

protocol CurrentWeatherChildDelegate: AnyObject {
  func didFinishCurrentWeatherCordinator(coordinator: ChildCoordinator)
}

final class CurrentWeatherChildCoordinator: ChildCoordinator {
    
    var navigationController: UINavigationController
    var parentCoordinator: ParentCoordinator?
    public weak var delegate: CurrentWeatherChildDelegate?
    
    init(navigationcontroller:UINavigationController) {
      self.navigationController = navigationcontroller
    }
    
    func startChild() {
        
    }
    
    
}
