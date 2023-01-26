//
//  ScheduleListViewModel.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleListViewModel {
    
    private let useCase: ScheduleUseCase!
    
    init(useCase: ScheduleUseCase = ScheduleUseCase()) {
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
