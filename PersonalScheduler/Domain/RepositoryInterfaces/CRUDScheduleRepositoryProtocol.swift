//
//  CRUDScheduleRepositoryProtocol.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

protocol CRUDScheduleRepositoryProtocol {
    func createSchedule(item: ViewSchedule)
    func readSchedule(completion: @escaping (([ViewSchedule]) -> Void))
    func updateSchedule(item: ViewSchedule)
    func deleteSchedule(item: ViewSchedule)
}
