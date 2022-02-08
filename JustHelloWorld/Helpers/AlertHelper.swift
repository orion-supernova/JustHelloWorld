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
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) in
            completion!(true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)

        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertVC, animated: true, completion: nil)
    }
}

