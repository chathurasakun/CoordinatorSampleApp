//
//  NotificationCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//
import UIKit

class NotificationCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let notificationViewModel = NotificationViewModel()
        let notificationViewController = NotificationViewController(viewModel: notificationViewModel)
        navigationController.pushViewController(notificationViewController, animated: false)
    }
}
