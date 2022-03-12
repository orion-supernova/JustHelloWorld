//
//  GameViewEasy.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct GameViewEasy: View {

    @StateObject private var viewModal = GameViewModelEasy()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {

        GeometryReader { geometry in

            VStack {
                Spacer()

                LazyVGrid(columns: viewModal.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                                .opacity(0.5)
                                .frame(width: geometry.size.width/3 - 15,
                                       height: geometry.size.width/3 - 15)

                            Image(systemName: viewModal.moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            viewModal.playerProcessMove(for: i)
                        }

                    }

                }

                Spacer()
            }
            .disabled(viewModal.isGameboardDisabled)
            .padding()
            .alert(item: $viewModal.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      primaryButton: .cancel(alertItem.buttonTitleForReset,
                                              action: {
                                                viewModal.resetGame() }),
                      secondaryButton: .default(alertItem.buttonTitleForMainMenu, action: {
                        viewModal.resetGame()
                    viewRouter.currentPage = .tictactoe(.modeScreen)
                      }))

            }
        }
    }
}

struct GameViewEasy_Previews: PreviewProvider {
    static var previews: some View {
        GameViewEasy()
    }
}
