//
//  HomeCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let dashboardViewModel = DashboardViewModel()
        let dashboardViewController = DashboardViewController(viewModel: dashboardViewModel)
        navigationController.pushViewController(dashboardViewController, animated: false)
    }
}
