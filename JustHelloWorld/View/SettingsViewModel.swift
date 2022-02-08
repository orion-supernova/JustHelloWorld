//
//  SettingsViewModel.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 8.02.2022.
//

import Foundation


struct SettingsObject {
    var changeBGCColor: Bool = true
    var changeTextColor: Bool = true
    var changeTextLanguage: Bool = false
    var isAutomatic: Bool = false
}
class SettingsViewModel: ObservableObject {
    @Published var settingsObject = SettingsObject()

    func toggleBGColor() {
    }
    func toggleTextColor() {
    }
    func toggleSideMenuColor() {
    }
    func toggleLanguage() {
    }
    func toggleAtutomatic() {

    }
}



