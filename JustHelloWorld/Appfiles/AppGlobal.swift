//
//  AppGlobal.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import Foundation

class AppGlobal {
    static let shared: AppGlobal = {
        return AppGlobal()
    }()

    var username: String? {
        get {
            return UserDefaults.standard.value(forKey: "username") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "username")
        }
    }
    var userID: String? {
        get {
            return UserDefaults.standard.value(forKey: "userID") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userID")
        }
    }
    var fcmToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "fcmToken") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "fcmToken")
        }
    }
}