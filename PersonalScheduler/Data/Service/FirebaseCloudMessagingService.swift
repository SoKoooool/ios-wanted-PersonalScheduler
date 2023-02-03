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
        
    }
    
    private func makeRequest(with data: Data, completion : @escaping (URLRequest) -> Void) {
        getAccessToken { [weak self] token in
            guard let token = token,
                  let string = self?.fcmString,
                  let url = URL(string: string) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = data
            completion(request)
        }
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
