//
//  FirebaseCloudMessagingService.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/02.
//

import Foundation

final class FirebaseCloudMessagingService {
    
    private let fcmString = "https://fcm.googleapis.com/v1/projects/personalscheduler-2d82d/messages:send"
    private let oauth2String = "https://www.googleapis.com/auth/firebase.messaging"
    
    func registerRemoteNotification(data: Data) {
        guard let request = makeRequest(with: data) else { return }
        URLSession.shared.dataTask(with: request) { data, response, error in
            
        }.resume()
    }
    
    private func makeRequest(with data: Data) -> URLRequest? {
        guard let url = URL(string: fcmString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Authorization", forHTTPHeaderField: "Bearer" + getAccessToken())
        request.httpBody = data
        return request
    }
    
    private func getAccessToken() -> String {
        let token = ""
        return token
    }
}
