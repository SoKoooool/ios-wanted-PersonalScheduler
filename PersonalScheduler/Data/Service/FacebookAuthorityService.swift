//
//  FacebookAuthorityService.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/02/08.
//

import Foundation
import FacebookLogin
import FirebaseAuth
import CryptoKit

final class FacebookAuthorityService: NSObject {
    
    var didCompleteWithAuthorization: ((AuthDataResult?) -> Void)?
    var didCompleteWithError: ((Error) -> Void)?
    
    private var currentNonce: String?
}

// MARK: - Facebook LoginButton Delegate

extension FacebookAuthorityService: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let credential = FacebookAuthProvider
            .credential(withAccessToken: AccessToken.current!.tokenString)
        
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if error != nil {
                guard let error = error else { return }
                self?.didCompleteWithError?(error)
                print(error.localizedDescription)
            }
            self?.didCompleteWithAuthorization?(authResult)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
