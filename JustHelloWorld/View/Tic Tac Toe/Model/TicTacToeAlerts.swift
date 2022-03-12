//
//  TicTacToeAlerts.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct TicTacToeAlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitleForReset: Text
    var buttonTitleForMainMenu: Text
}

struct TicTacToeAlertContext {
    static let humanWin = TicTacToeAlertItem(title: Text("You Win!"),
                                    message: Text("You are smart! I guess..."),
                                    buttonTitleForReset: Text("Restart"),
                                    buttonTitleForMainMenu: Text("Main Menu"))
    static let computerWin = TicTacToeAlertItem(title: Text("You Lost!"),
                                       message: Text("You are a shame..."),
                                       buttonTitleForReset: Text("Restart"),
                                       buttonTitleForMainMenu: Text("Main Menu"))
    static let draw = TicTacToeAlertItem(title: Text("Draw!"),
                                message: Text("Interesting..."),
                                buttonTitleForReset: Text("Restart"),
                                buttonTitleForMainMenu: Text("Main Menu"))
}
