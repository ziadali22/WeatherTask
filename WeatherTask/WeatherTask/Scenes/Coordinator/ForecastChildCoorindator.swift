//
//  ForecastChildCoorindator.swift
//  WeatherTask
//
//  Created by ziad on 27/03/2023.
//

import UIKit

protocol ForecastChildDelegate: AnyObject {
  func didFinishForecastCordinator(coordinator: ChildCoordinator)
}

final class ForecastChildCoorindator: ChildCoordinator {
    
    var navigationController: UINavigationController
    var parentCoordinator: ParentCoordinator?
    public weak var delegate: ForecastChildDelegate?
    
    init(navigationcontroller:UINavigationController) {
      self.navigationController = navigationcontroller
    }
    
    
    func startChild() {
        let foreCastViewModel = WeatherForecastViewModel()
        let foreCastViewController = WeatherForecastViewController(viewModel: foreCastViewModel)
        foreCastViewController.coordinator = self
        self.navigationController.pushViewController(foreCastViewController, animated: true)
    }
    
    
}

// MARK: - Navigation Flow
extension ForecastChildCoorindator {
    
    func navigateToSearchOptions() {
        let searchViewController = SearchViewController(viewModel: SearchViewModel())
        searchViewController.modalPresentationStyle = .popover
        self.navigationController.present(searchViewController, animated: true)
    }
}
