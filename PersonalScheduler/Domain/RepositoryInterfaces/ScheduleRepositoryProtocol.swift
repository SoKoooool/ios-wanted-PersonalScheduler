//
//  ScheduleRepositoryProtocol.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

protocol ScheduleRepositoryProtocol {
    func create(data: [String : Any])
    func read(completion: @escaping (([ViewSchedule]) -> Void))
    func update(id: String, data: [String : Any])
    func delete(id: String)
}
