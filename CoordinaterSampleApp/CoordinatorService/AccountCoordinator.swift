//
//  AccountCoordinator.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//
import UIKit

class AccountCoordinator: Coordinator {
    weak var parentCoordinator: TabCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let myAccountViewModel = MyAccountViewModel()
        let myAccountViewController = MyAccountViewController(viewModel: myAccountViewModel)
        myAccountViewController.coordinator = self
        navigationController.pushViewController(myAccountViewController, animated: false)
    }
    
    func movetoViewProfile() {
        let profileViewModel = ProfileViewModel()
        let profileViewController = ProfileViewController(viewModel: profileViewModel)
        profileViewController.coordinator = self
        navigationController.pushViewController(profileViewController, animated: true)
    }
    
    func movetoEditProfile() {
        let editProfileViewModel = EditProfileViewModel()
        let editProfileViewController = EditProfileViewControlller(viewModel: editProfileViewModel)
        navigationController.pushViewController(editProfileViewController, animated: true)
    }
    
    func movetoAuthFlow() {
        parentCoordinator?.movetoAuthFlow()
    }
}

