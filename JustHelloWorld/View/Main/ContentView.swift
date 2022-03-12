//
//  ContentView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentPage {
        case .launchScreen :
            LaunchScreen()
        case .mainScreen:
            MainScreen()
        case .surpriseScreen:
            SurpriseScreen()
        case .matrixVideoScreen:
            MatrixVideoScreen()
        case .matrixRainView:
            MatrixRainView()
        case .chatScreen:
            LoginScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
