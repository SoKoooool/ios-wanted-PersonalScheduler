//
//  ViewSchedule.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation

struct ViewSchedule {
    let id: String
    let title: String?
    let startDate: String?
    let endDate: String?
    let content: String?
    let isCurrentDate: Bool?
    
    init(_ data: [String : Any]) {
        self.id = data["id"] as? String ?? "id"
        self.title = data["title"] as? String
        self.startDate = data["startDate"] as? String
        self.endDate = data["endDate"] as? String
        self.content = data["content"] as? String
        self.isCurrentDate = data["isCurrentDate"] as? Bool
    }
    
    init(id: String,
         title: String,
         startDate: String,
         endDate: String,
         content: String,
         isCurrentDate: Bool = false) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.content = content
        self.isCurrentDate = isCurrentDate
    }
    
    func toData() -> [String: Any] {
        var data = [String : Any]()
        data["id"] = self.id
        data["title"] = self.title
        data["starDate"] = self.startDate
        data["endDate"] = self.endDate
        data["content"] = self.content
        data["isCurrentDate"] = self.isCurrentDate
        return data
    }
}
