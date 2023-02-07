//
//  AppDelegate.swift
//  PersonalScheduler
//
//  Created by kjs on 06/01/23.
//

import UIKit
import AuthenticationServices
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        self.registerForRemoteNotifications()
        
        return true
    }
    
    private func confirmCredentialState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { state, error in
            switch state {
            case .authorized:
                let viewController = ScheduleListViewController()
                self.window = UIWindow()
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            case .revoked, .notFound:
                let viewController = LoginViewController()
                self.window = UIWindow()
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            default:
                break
            }
        }
    }
}

// MARK: - Register Remote Notifications

extension AppDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
    
    private func registerForRemoteNotifications() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions) { _, _ in }
        UIApplication.shared.registerForRemoteNotifications()
    }
}

// MARK: - UNUserNotificationCenter Delegate

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print(userInfo)
        completionHandler()
    }
}

// MARK: - Firebase Cloud Messaging Delegate

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")

        do {
            try KeychainItem(service: "com.wanted.PersonalScheduler", account: "token").saveItem(fcmToken ?? "Not Token")
        } catch {
            print("Unable to save token to keychain.")
        }
    }
}
