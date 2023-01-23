//
//  CRUDScheduleRepository.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class CRUDScheduleRepository: CRUDScheduleRepositoryProtocol {
    
    private let service = FirestoreService()
    
    func createSchdule(item: ViewSchedule) {
        service.add(data: item.toData())
    }
    
    func readSchedule(completion: @escaping ([ViewSchedule]) -> Void) {
        service.get { completion($0) }
    }
    
    func updateSchedule(item: ViewSchedule) {
        service.set(data: item.toData(), uid: item.uuid.uuidString)
    }
    
    func deleteSchedule(item: ViewSchedule) {
        guard let title = item.title else { return }
        service.delete(key: title, uid: item.uuid.uuidString)
    }
}
