//
//  AlertHelper.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 8.02.2022.
//

import UIKit

final class AlertHelper {
    typealias AlertCompletion = ((Bool) -> Void)?

    static func alertMessage(title: String, message: String, completion: AlertCompletion) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) in
            completion!(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertController, animated: true, completion: nil)
    }

    static func basicAlertMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)

        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertController, animated: true, completion: nil)
    }

    static func textFieldAlert(title: String, message: String, completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = AppGlobal.shared.username ?? "Username"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            guard let textFields = alertController.textFields else { return }
            var username = ""
            if let usernameTemp = textFields[0].text {
                username = usernameTemp
            }
            AppGlobal.shared.username = username
            completion(username)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertController, animated: true, completion: nil)
    }
}

