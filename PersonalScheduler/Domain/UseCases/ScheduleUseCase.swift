//
//  ScheduleUseCase.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleUseCase {
    
    private let repository: ScheduleRepositoryProtocol!
    
    init(repository: ScheduleRepositoryProtocol = ScheduleRepository()) {
        self.repository = repository
    }
    
    func executeCreateSchedule(item: ViewSchedule) {
        repository.createSchedule(item: item)
    }
    
    func executeReadSchedules(onComplete: @escaping (([ViewSchedule])) -> Void) {
        repository.readSchedule { onComplete($0) }
    }
    
    func executeUpdateSchedule(item: ViewSchedule) {
        repository.updateSchedule(item: item)
    }
    
    func executeDeleteSchedule(item: ViewSchedule) {
        repository.deleteSchedule(item: item)
    }
}
