//
//  ScheduleFormViewModel.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/02.
//

import Foundation

final class ScheduleFormViewModel {
    
    private let useCase: ScheduleUseCase!
    
    init(useCase: ScheduleUseCase = ScheduleUseCase()) {
        self.useCase = useCase
    }
    
    func saveSchedule(item: ViewSchedule) {
        useCase.executeCreateSchedule(item: item)
        useCase.executePushNotification(item: item)
    }
    
    func modifySchedule(item: ViewSchedule) {
        useCase.executeUpdateSchedule(item: item)
    }
}
