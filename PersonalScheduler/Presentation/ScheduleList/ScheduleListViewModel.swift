//
//  ScheduleListViewModel.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleListViewModel {
    
    private let useCase: ScheduleUseCase!
    var scheduleList = Observable([ViewSchedule]())
    
    init(useCase: ScheduleUseCase = ScheduleUseCase()) {
        self.useCase = useCase
    }
    
    func reload() {
        useCase.executeReadSchedules { [weak self] schedules in
            self?.scheduleList.value = schedules
        }
    }
    
    func removeSchedule(item: ViewSchedule) {
        useCase.executeDeleteSchedule(item: item)
    }
}
