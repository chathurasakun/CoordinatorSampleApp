//
//  TabCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//

import UIKit

class TabCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabController = UITabBarController()
        
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        let homeNavController = setNavigationController(title: "Home", image: .mostViewed, child: homeCoordinator, tag: 0)
        
        let accountCoordinator = AccountCoordinator(navigationController: UINavigationController())
        accountCoordinator.parentCoordinator = self
        let accountNavController = setNavigationController(title: "Account", image: .featured, child: accountCoordinator, tag: 1)
        
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        let settingsNavController = setNavigationController(title: "Settings", image: .contacts, child: settingsCoordinator, tag: 2)
        
        let notificationCoordinator = NotificationCoordinator(navigationController: UINavigationController())
        let notificationNavController = setNavigationController(title: "Notifications", image: .downloads, child: notificationCoordinator, tag: 3)
        
        mainTabController.viewControllers = [homeNavController, accountNavController, settingsNavController, notificationNavController]
        navigationController.setViewControllers([mainTabController], animated: false)
    }
    
    private func setNavigationController(title: String, image: UITabBarItem.SystemItem, child: Coordinator, tag: Int) -> UINavigationController {
        childCoordinators.append(child)
        child.start()
        
        let navController = child.navigationController
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: image, tag: tag)
        return navController
    }
    
    func movetoAuthFlow() {
        parentCoordinator?.movetoAuthFlow(self)
    }
}

