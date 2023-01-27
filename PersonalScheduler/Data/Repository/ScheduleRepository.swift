//
//  ScheduleRepository.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class ScheduleRepository: ScheduleRepositoryProtocol {
    
    private let service = FirestoreService()
    
    func create(data: [String : Any]) {
        service.addDocument(data: data)
    }
    
    func read(uid: String, completion: @escaping ([ViewSchedule]) -> Void) {
        service.getDocuments(uid: uid) { completion($0) }
    }
    
    func update(id: String, data: [String : Any]) {
        service.updateDocument(id: id, data: data)
    }
    
    func delete(id: String) {
        service.deleteDocument(id: id)
    }
}
