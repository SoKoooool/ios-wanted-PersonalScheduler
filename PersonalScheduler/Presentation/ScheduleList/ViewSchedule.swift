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
    
    init(_ item: [String : Any]) {
        self.id = item["id"] as? String ?? "id"
        self.title = item["title"] as? String
        self.startDate = item["startDate"] as? String
        self.endDate = item["endDate"] as? String
        self.content = item["content"] as? String
        self.isCurrentDate = item["isCurrentDate"] as? Bool
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
    
    func decode() -> [String: Any] {
        var data = [String : Any]()
        data["id"] = self.id
        data["title"] = self.title
        data["starDate"] = self.startDate
        data["endDate"] = self.endDate
        data["content"] = self.content
        data["isCurrentDate"] = self.isCurrentDate
        return data
    }
    
    func toData() -> Data? {
        struct Payload: Encodable {
            let message: Message
        }
        struct Message: Encodable {
            let token: String
            let notification: Noti
        }
        struct Noti: Encodable {
            let title: String
            let body: String
        }
        let token = getFCMToken()
        let noti = Noti(title: self.title!, body: self.content!)
        let message = Message(token: token, notification: noti)
        let payload = Payload(message: message)
        
        guard let jsonData = try? JSONEncoder().encode(payload),
        let dictionary = try? JSONSerialization.jsonObject(with: jsonData) as? NSDictionary,
              let dictionaryData = try? JSONSerialization.data(withJSONObject: dictionary),
              let jsonString = String(data: dictionaryData, encoding: .utf8) else { return nil }
        return jsonString.data(using: .utf8)
    }
    
    private func getFCMToken() -> String {
        var fcmToken = ""
        let name = NSNotification.Name("fcmToken")
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
            guard let token = notification.userInfo?["token"] as? String else { return }
            fcmToken = token
        }
        return fcmToken
    }
}
