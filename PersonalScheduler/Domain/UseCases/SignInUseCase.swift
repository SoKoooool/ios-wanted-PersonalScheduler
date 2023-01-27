//
//  SignInUseCase.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/13.
//

import Foundation

final class SignInUseCase {
    
    private let repository: SignInRepositoryProtocol!
    
    init(repository: SignInRepositoryProtocol = SignInRepository()) {
        self.repository = repository
    }
    
    func appleSignIn() {
        repository.appleIDAuthorization { [weak self] result in
            switch result {
            case let .success(data):
                guard let data = data else { return }
                self?.saveUserInKeychain(data.user.uid)
                
//                FirestoreService().getDocuments { schedules in
//                    print(schedules)
//                }
                
                let model = ["title" : "제목",
                             "content" : "내용",
                             "startDate" : "시작일",
                             "endDate" : "종료일",
                             "isCurrentDate" : false]
                FirestoreService().addDocument(data: model)
                
            case let .failure(error):
                print(#function)
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveUserInKeychain(_ uid: String) {
        do {
            try KeychainItem(service: "com.wanted.PersonalScheduler", account: "uid").saveItem(uid)
        } catch {
            print("Unable to save uid to keychain.")
        }
    }
}
