//
//  ProfileViewController.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Variables
    weak var coordinator: AccountCoordinator?
    var viewModel: ProfileViewModel!
    
    // MARK: - Components
    private var lblTitle: UILabel!
    private var barBtnEdit: UIBarButtonItem!
    
    init(viewModel: ProfileViewModel) {
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
    private func setupUI() {
        view.backgroundColor = .systemMint
        
        barBtnEdit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onTapEdit(_:)))
        navigationItem.rightBarButtonItem = barBtnEdit
        
        lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "This is ProfileViewController"
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 1
        view.addSubview(lblTitle)
        
        let titleLabelConstraints = [
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            lblTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    @objc private func onTapEdit(_ sender: UIBarButtonItem) {
        coordinator?.movetoEditProfile()
    }

}
