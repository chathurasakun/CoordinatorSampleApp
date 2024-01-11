//
//  MainCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let initViewModel = InitialViewModel()
        let initialViewConstroller = InitialViewController(viewModel: initViewModel)
        initialViewConstroller.coordinator = self
        navigationController.pushViewController(initialViewConstroller, animated: false)
    }
    
    func movetoAuthFlow(_ child: Coordinator?) {
        childDidFinish(child)
        
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.parentCoordinator = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    func onAuthenticateSuccessful(_ child: Coordinator) {
        childDidFinish(child)
        
        let tabCoordinator = TabCoordinator(navigationController: navigationController)
        tabCoordinator.parentCoordinator = self
        childCoordinators.append(tabCoordinator)
        tabCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
