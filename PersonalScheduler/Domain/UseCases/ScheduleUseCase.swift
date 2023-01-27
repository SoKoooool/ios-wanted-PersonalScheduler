//
//  ScheduleUseCase.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleUseCase {
    
    private let repository: ScheduleRepositoryProtocol!
    private var uid: String {
        do {
            return try KeychainItem(service: "com.wanted.PersonalScheduler", account: "uid").readItem()
        } catch {
            print("Unable to load uid to keychain.")
            return "uid"
        }
    }
    
    init(repository: ScheduleRepositoryProtocol = ScheduleRepository()) {
        self.repository = repository
    }
    
    func executeCreateSchedule(item: ViewSchedule) {
        repository.create(data: item.toData())
    }
    
    func executeReadSchedules(onComplete: @escaping (([ViewSchedule])) -> Void) {
        repository.read(uid: uid) { onComplete($0) }
    }
    
    func executeUpdateSchedule(item: ViewSchedule) {
        repository.update(id: item.id, data: item.toData())
    }
    
    func executeDeleteSchedule(item: ViewSchedule) {
        repository.delete(id: item.id)
    }
}
