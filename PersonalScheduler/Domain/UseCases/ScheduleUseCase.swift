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
    
    func postExcute(for item: ViewSchedule) {
        repository.createSchedule(item: item)
    }
    
    func getExecute(onComplete: @escaping (([ViewSchedule])) -> Void) {
        repository.readSchedule { onComplete($0) }
    }
    
    func putExecute(for item: ViewSchedule) {
        repository.updateSchedule(item: item)
    }
    
    func deleteExecute(for item: ViewSchedule) {
        repository.deleteSchedule(item: item)
    }
}
