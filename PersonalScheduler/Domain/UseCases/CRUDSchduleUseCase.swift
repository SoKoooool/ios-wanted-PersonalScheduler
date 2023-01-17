//
//  CRUDSchduleUseCase.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

final class CRUDScheduleUseCase {
    
    private let repository: CRUDScheduleRepositoryProtocol!
    
    init(repository: CRUDScheduleRepositoryProtocol = CRUDScheduleRepository()) {
        self.repository = repository
    }
    
    func loadSchedule() {
        
    }
}
