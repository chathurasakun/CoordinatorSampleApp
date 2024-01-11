//
//  AuthCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//

import UIKit

class AuthCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        loginViewController.coordinator = self
        navigationController.setViewControllers([loginViewController], animated: true)
    }
    
    func onAuthenticateSuccessful() {
        parentCoordinator?.onAuthenticateSuccessful(self)
    }
}
