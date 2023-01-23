//
//  ViewSchedule.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

struct ViewSchedule {
    let title: String?
    let startDate: String?
    let endDate: String?
    let content: String?
    let isCurrentDate: Bool?
    
    init(_ data: [String : Any]) {
        self.title = data["title"] as? String
        self.startDate = data["startDate"] as? String
        self.endDate = data["endDate"] as? String
        self.content = data["content"] as? String
        self.isCurrentDate = data["isCurrentDate"] as? Bool
    }
}
