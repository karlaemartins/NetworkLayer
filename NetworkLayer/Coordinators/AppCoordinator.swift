//
//  AppCoordinator.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 01/04/26.
//

import UIKit

class AppCoordinator {

    let navigationController: UINavigationController
    var childCoordinators: [AnyObject] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}

