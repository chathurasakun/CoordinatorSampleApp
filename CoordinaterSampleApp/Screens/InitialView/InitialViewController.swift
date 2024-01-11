//
//  ViewController.swift
//  CoordinaterSampleApp
//
//  Created by CHATHURA ELLAWALA on 2024-01-06.
//

import UIKit

class InitialViewController: UIViewController {
    // MARK: - Variables
    weak var coordinator: MainCoordinator?
    var viewModel: InitialViewModel!
    
    // MARK: - Components
    private var lblTitle: UILabel!
    
    init(viewModel: InitialViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        checkEligabilityStatus()
    }
    
    // MARK: - Setup UI
    func setupUI() {
        view.backgroundColor = .yellow
        
        lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "This is InitialViewController"
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

// MARK: - Network
extension InitialViewController {
    func checkEligabilityStatus() {
        viewModel.checkAligability() { (response, status, success) in
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                self.coordinator?.movetoAuthFlow(nil)
                timer.invalidate()
            }
        }
    }
}

