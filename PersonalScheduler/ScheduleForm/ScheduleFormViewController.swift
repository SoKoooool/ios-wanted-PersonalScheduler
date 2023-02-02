//
//  ScheduleFormViewController.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/02.
//

import UIKit

// MARK: - Life Cycle

final class ScheduleFormViewController: UIViewController {
    
    private let viewModel: ScheduleFormViewModel!
    
    init(viewModel: ScheduleFormViewModel = ScheduleFormViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = ScheduleFormViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions

extension ScheduleListViewController {
    
}

// MARK: - Attributes

extension ScheduleListViewController {
    
}

// MARK: - Bind

extension ScheduleListViewController {
    
}

// MARK: - Constraints

extension ScheduleListViewController {
    
}
