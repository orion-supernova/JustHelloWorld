//
//  JustHelloWorldApp.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI
import Firebase
import FirebaseMessaging
import UserNotifications

enum Identifiers {
    static let viewAction = "VIEW_IDENTIFIER"
    static let messageCategory = "MESSAGE_CATEGORY"
}

class AppDelegate: NSObject, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self

        registerForPushNotifications()
        AppGlobal.shared.fcmToken = Messaging.messaging().fcmToken

        // Check if launched from notification
        let notificationOption = launchOptions?[.remoteNotification]
        if  let notification = notificationOption as? [String: AnyObject], let aps = notification["aps"] as? [String: AnyObject] {
            //
        }
        return true
    }

    // MARK: - Apple Push Notifications Service
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, _ in
            print("Permission granted: \(granted)")
            guard granted else { return }

            let viewAction = UNNotificationAction(
                identifier: Identifiers.viewAction,
                title: "Açalım bakalım",
                options: [.foreground])


            let newsCategory = UNNotificationCategory(
                identifier: Identifiers.messageCategory,
                actions: [viewAction],
                intentIdentifiers: [],
                options: [])


            UNUserNotificationCenter.current().setNotificationCategories([newsCategory])

            self?.getNotificationSettings()
        }
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        guard let aps = userInfo["aps"] as? [String: AnyObject] else {
            completionHandler(.failed)
            return
        }
        //
    }


    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else { return }
            print("DEBUG: APNS Token: " + token)
        }
    }
}

@main
struct JustHelloWorldApp: App {
    @StateObject var viewRouter = ViewRouter()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
        }
    }
}
