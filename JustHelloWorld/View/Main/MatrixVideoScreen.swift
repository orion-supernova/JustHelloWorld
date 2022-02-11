//
//  MatrixVideoScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 11.02.2022.
//

import SwiftUI
import AVKit

struct MatrixVideoScreen: View {

    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "matrixAnimation", ofType: "mp4")!))
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            AvPlayerControllerRepresented(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: {
                    player.play()
                })
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    viewRouter.currentPage = .chatScreen
                }
            }
        })
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatrixVideoScreen()
    }
}
