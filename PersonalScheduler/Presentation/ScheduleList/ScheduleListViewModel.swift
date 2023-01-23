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
        useCase.getExecute { schedules in
            print(schedules)
        }
    }
    
    func save(schedule: ViewSchedule) {
        useCase.postExcute(for: schedule)
    }
    
    func edit(schedule: ViewSchedule) {
        useCase.putExecute(for: schedule)
    }
    
    func remove(schedule: ViewSchedule) {
        useCase.deleteExecute(for: schedule)
    }
}
