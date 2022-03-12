//
//  RabbitHoleHub.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct RabbitHoleHub: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {

            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    HStack {
                        Spacer()
                        Button {
                            viewRouter.currentPage = .quizGame
                        } label: {
                            Image(systemName: "questionmark.square.dashed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getRect().width/4)
                                .foregroundColor(Color.matrixGreen)
                        }

                        Spacer()

                        Button {
                            viewRouter.currentPage = .terminalChat
                        } label: {
                            Image(systemName: "terminal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getRect().width/4)
                                .foregroundColor(Color.matrixGreen)
                        }
                        Spacer()
                    }
                    Spacer()
                        .frame(maxHeight: 50 )

                    HStack {
                        Spacer()
                        Button {
                            viewRouter.currentPage = .tictactoe(.modeScreen)
                        } label: {
                            Image(systemName: "square.grid.3x3.topright.filled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getRect().width/4)
                                .foregroundColor(Color.matrixGreen)
                        }

                        Spacer()

                        Button {
                            AlertHelper.basicAlertMessage(title: "In Progress", message: "")
                        } label: {
                            Image(systemName: "abc")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getRect().width/4)
                                .foregroundColor(Color.matrixGreen)
                        }
                        Spacer()
                    }
                    Spacer()

                    Button {
                        viewRouter.currentPage = .loginScreen
                    } label: {
                        Text("Go back")
                            .padding(8)
                            .foregroundColor(Color.matrixGreen)
                            .border(Color.matrixGreen, width: 0.5)
                    }

                    Spacer()
                        .frame(maxHeight: 20)
                }
            }

        }
}

struct RabbitHoleHub_Previews: PreviewProvider {
    static var previews: some View {
        RabbitHoleHub()
    }
}
