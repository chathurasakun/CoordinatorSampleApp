//
//  UserSettingsViewController.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-11.
//

import UIKit

class UserSettingsViewController: UIViewController {
    // MARK: - Variables
    weak var coordinator: AccountCoordinator?
    var viewModel: UserSettingsViewModel!
    
    // MARK: - Components
    private var lblTitle: UILabel!
    
    init(viewModel: UserSettingsViewModel) {
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
        view.backgroundColor = .systemGreen
        
        lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "This is UserSettingsViewController"
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 1
        view.addSubview(lblTitle)
        
        let titleLabelConstraints = [
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            lblTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
}
