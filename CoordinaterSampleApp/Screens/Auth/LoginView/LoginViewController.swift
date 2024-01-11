//
//  LoginViewController.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-07.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Variables
    weak var coordinator: AuthCoordinator?
    var viewModel: LoginViewModel!
    
    // MARK: - Components
    private var titleLable: UILabel!
    private var loginButton: UIButton!
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .green
        
        titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "This is LoginViewController"
        titleLable.textAlignment = .center
        titleLable.numberOfLines = 1
        view.addSubview(titleLable)
        
        let titleLabelConstraints = [
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 7
        view.addSubview(loginButton)
        
        let loginButtonConstraints = [
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            loginButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(loginButtonConstraints)
        
        loginButton.addTarget(self, action: #selector(onTapLoginButton(_:)), for: .touchUpInside)
    }
    
    @objc private func onTapLoginButton(_ sender: UIButton) {
        coordinator?.onAuthenticateSuccessful()
    }

}
