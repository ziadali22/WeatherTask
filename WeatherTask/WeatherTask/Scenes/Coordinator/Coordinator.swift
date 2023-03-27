//
//  Coordinator.swift
//  WeatherTask
//
//  Created by ziad on 27/03/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [ChildCoordinator] { get set }
    func startFlow()
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator : ParentCoordinator? { get set }
    func startChild()
}

/**
 We can store new coordinators to our stack and remove those one when the flow has been completed
 (i.e.: user navigated back, view has been dismissed, etc).
 */
extension ParentCoordinator {
    func addChild(child: ChildCoordinator) {
        childCoordinators.append(child)
    }
    func removeChild(child: ChildCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
}
