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
        repository.create(data: item.toData())
    }
    
    func executeReadSchedules(onComplete: @escaping (([ViewSchedule])) -> Void) {
        repository.read { onComplete($0) }
    }
    
    func executeUpdateSchedule(item: ViewSchedule) {
        repository.update(id: item.uuid, data: item.toData())
    }
    
    func executeDeleteSchedule(item: ViewSchedule) {
        repository.delete(id: item.uuid)
    }
}
