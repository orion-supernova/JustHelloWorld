//
//  ViewRouter.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .launchScreen
}

enum Page {
    case launchScreen
    case mainScreen
    case surpriseScreen
    case matrixVideoScreen
    case matrixRainView
    case loginScreen
    case rabbitHoleHub
    case quizGame
    case terminalChat
}
