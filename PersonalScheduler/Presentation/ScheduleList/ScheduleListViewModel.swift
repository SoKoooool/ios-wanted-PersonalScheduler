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
        useCase.executeReadSchedules { schedules in
            print(schedules)
        }
    }
    
    func saveSchedule(item: ViewSchedule) {
        useCase.executeCreateSchedule(item: item)
    }
    
    func editSchedule(item: ViewSchedule) {
        useCase.executeUpdateSchedule(item: item)
    }
    
    func removeSchedule(item: ViewSchedule) {
        useCase.executeDeleteSchedule(item: item)
    }
}
