//
//  MainCoordinator.swift
//  WeatherTask
//
//  Created by ziad on 27/03/2023.
//

import Foundation
import UIKit

/**
 Your app should consist of multiple coordinators, one for each scene.
 But it should always have one “main” AppCoordinator, which will be owned by the App Delegate.
 The following code is an example of a basic AppCoordinator.
 All other coordinators in the application will be children of this coordinator.
 */
class MainCoordinator: ParentCoordinator {
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinators: [ChildCoordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Flow
    func startFlow() {

        let dashBoardViewControlelr = DashBoardViewController(viewModel: DashBoardViewModel())
        dashBoardViewControlelr.coordinator = self
        navigationController.pushViewController(dashBoardViewControlelr, animated: true)
    }
    
}
// MARK: - Navigation
extension MainCoordinator {
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Enable Gps For Weather", message: "GPS access is restricted. In order to get weather data, please enable GPS in the Settigs app under Privacy, Location Services.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Go to Settings now", style: UIAlertAction.Style.default, handler: { (alert: UIAlertAction!) in
            if let url = URL(string: "App-prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
                    }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
            self.navigationController.dismiss(animated: true)
        }))
        
        alert.modalPresentationStyle = .overFullScreen
        self.navigationController.present(alert, animated: true)
    }
    
    func naviagteToForecast() {
        
        let forecastChildCoordinator = ForecastChildCoorindator(navigationcontroller: self.navigationController)
        addChild(child: forecastChildCoordinator)
        forecastChildCoordinator.startChild()
    }
    
    func navigateToCurrentWeather() {
        let currentWeatherChildCoordinator = CurrentWeatherChildCoordinator(navigationcontroller: self.navigationController)
        addChild(child: currentWeatherChildCoordinator)
        currentWeatherChildCoordinator.startChild()
    }
}

// MARK: - Remove Child
extension MainCoordinator: ForecastChildDelegate {
    func didFinishForecastCordinator(coordinator: ChildCoordinator) {
        self.removeChild(child: coordinator)
    }
}

extension MainCoordinator: CurrentWeatherChildDelegate {
    func didFinishCurrentWeatherCordinator(coordinator: ChildCoordinator) {
        self.removeChild(child: coordinator)
    }
}
