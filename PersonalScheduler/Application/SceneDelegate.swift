//
//  SceneDelegate.swift
//  PersonalScheduler
//
//  Created by kjs on 06/01/23.
//

import UIKit
import AuthenticationServices

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        confirmCredentialState()
        window?.makeKeyAndVisible()
    }
    
    private func confirmCredentialState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { state, error in
            DispatchQueue.main.async {
                let viewController: UIViewController
                switch state {
                case .authorized:
                    viewController = ScheduleListViewController()
                case .revoked, .notFound:
                    viewController = LoginViewController()
                default:
                    viewController = LoginViewController()
                }
                self.window?.rootViewController = viewController
            }
        }
    }
}

