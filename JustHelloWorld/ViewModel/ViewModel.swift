//
//  SettingsViewModel.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 8.02.2022.
//

import Foundation
import SwiftUI


struct SettingsObject {
    var changeBGCColor: Bool = true
    var changeTextColor: Bool = true
    var changeTextLanguage: Bool = false
    var isAutomatic: Bool = false
    var isBlackAndWhite: Bool = false
}

class SettingsViewModel: ObservableObject {
    @Published var settingsObject = SettingsObject()
}

struct SurpriseObject {
    var isInverted: Bool = false
    var isTouchEnabledForTopView = false
    var didAlreadyOpenSurpriseScreen = false
}

class SurpriseScreenViewModel: ObservableObject {
    @Published var surpriseObject = SurpriseObject()
}

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    var _center: NotificationCenter

        init(center: NotificationCenter = .default) {
            _center = center
            _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    @objc func keyBoardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                withAnimation {
                   currentHeight = keyboardSize.height
                }
            }
        }
    @objc func keyBoardWillHide(notification: Notification) {
            withAnimation {
               currentHeight = 0
            }
        }
}



