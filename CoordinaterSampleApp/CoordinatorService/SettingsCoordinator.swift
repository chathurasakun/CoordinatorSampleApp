//
//  SettingsCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//
import UIKit

class SettingsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userSettingsViewModel = UserSettingsViewModel()
        let userSettingsViewController = UserSettingsViewController(viewModel: userSettingsViewModel)
        navigationController.pushViewController(userSettingsViewController, animated: false)
    }
}
