//
//  FirebaseCloudMessagingService.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/02.
//

import Foundation
import OAuth2

final class FirebaseCloudMessagingService {
    
    private let fcmString = "https://fcm.googleapis.com/v1/projects/personalscheduler-2d82d/messages:send"
    
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
        
        request.httpBody = data
        return request
    }
    
    private func getAccessToken(completion: @escaping (String?) -> Void) {
        guard let path = Bundle.main.path(forResource: "serviceAccountKey", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        let scopes = ["https://www.googleapis.com/auth/firebase.messaging"]
        let provider = ServiceAccountTokenProvider(credentialsURL: url, scopes: scopes)
        try? provider?.withToken({ token, error in
            guard error == nil else {
                print(error?.localizedDescription ?? #function)
                return
            }
            completion(token?.AccessToken)
        })
    }
}
