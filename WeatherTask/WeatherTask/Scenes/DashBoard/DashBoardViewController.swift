//  
//  DashBoardViewController.swift
//  WeatherTask
//
//  Created by ziad on 22/03/2023.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    // MARK: Outlets

    // MARK: Properties
        
    private let viewModel: DashBoardViewModelType

    // MARK: Init
        
    init(viewModel: DashBoardViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions
//
extension DashBoardViewController {
    
}

// MARK: - Configurations
//
extension DashBoardViewController {
    
}

// MARK: - Private Handlers
//
private extension DashBoardViewController {
}
