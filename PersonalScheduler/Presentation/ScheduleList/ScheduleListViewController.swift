//
//  ScheduleListViewController.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import UIKit

// MARK: - Life Cycle

final class ScheduleListViewController: UIViewController {
    
    private let viewModel: ScheduleListViewModel!
    
    init(viewModel: ScheduleListViewModel = ScheduleListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = ScheduleListViewModel()
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
