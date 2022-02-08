//
//  LaunchScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct LaunchScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            Color.init(red: 231/255, green: 145/255, blue: 21/255)
                .ignoresSafeArea()
            Image("JustHelloWorld-logos_transparent")
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    viewRouter.currentPage = .mainScreen
                }
            }
        })
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
