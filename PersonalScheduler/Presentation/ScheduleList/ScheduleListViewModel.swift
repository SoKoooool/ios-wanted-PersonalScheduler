//
//  ScheduleListViewModel.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleListViewModel {
    
    private let useCase: CRUDScheduleUseCase!
    
    init(useCase: CRUDScheduleUseCase = CRUDScheduleUseCase()) {
        self.useCase = useCase
    }
    
    func reload() {
        
    }
}
