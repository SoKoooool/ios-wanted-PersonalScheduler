//
//  Payload.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/06.
//

import Foundation

struct Payload: Encodable {
    let message: Message
    
    struct Message: Encodable {
        let token: String
        let notification: Noti
    }
    
    struct Noti: Encodable {
        let title: String
        let body: String
    }
}
