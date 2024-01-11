//
//  MyAccountViewController.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//

import UIKit

class MyAccountViewController: UIViewController {
    // MARK: - Varaibles
    weak var coordinator: AccountCoordinator?
    var viewModel: MyAccountViewModel!
    
    // MARK: - Components
    private var lblTitle: UILabel!
    private var btnLogout: UIButton!
    private var btnProfile: UIButton!
    
    init(viewModel: MyAccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Setup UI
    func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .cyan
        
        lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "This is MyAccountViewController"
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 1
        view.addSubview(lblTitle)
        
        let titleLabelConstraints = [
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            lblTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        btnProfile = UIButton()
        btnProfile.translatesAutoresizingMaskIntoConstraints = false
        btnProfile.setTitle("View Profile", for: .normal)
        btnProfile.setTitleColor(.systemGray, for: .normal)
        btnProfile.backgroundColor = .white
        btnProfile.layer.cornerRadius = 7
        view.addSubview(btnProfile)
        
        let profileButtonConstraints = [
            btnProfile.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            btnProfile.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            btnProfile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            btnProfile.heightAnchor.constraint(equalToConstant: 44)
        ]
        NSLayoutConstraint.activate(profileButtonConstraints)
        
        let profileButtonAction = UIAction { [weak self] _ in
            self?.goToViewProfile()
        }
        btnProfile.addAction(profileButtonAction, for: .touchUpInside)
        
        btnLogout = UIButton()
        btnLogout.translatesAutoresizingMaskIntoConstraints = false
        btnLogout.setTitle("Log out", for: .normal)
        btnLogout.setTitleColor(.white, for: .normal)
        btnLogout.backgroundColor = .blue
        btnLogout.layer.cornerRadius = 7
        view.addSubview(btnLogout)
        
        let logOutButtonConstraints = [
            btnLogout.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            btnLogout.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            btnLogout.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            btnLogout.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(logOutButtonConstraints)
        
        let logoutAction = UIAction { [weak self] _ in
            self?.logoutButtonTapped()
        }
        btnLogout.addAction(logoutAction, for: .touchUpInside)
    }
    
    func goToViewProfile() {
        coordinator?.movetoViewProfile()
    }
    
    func logoutButtonTapped() {
        coordinator?.movetoAuthFlow()
    }


}
