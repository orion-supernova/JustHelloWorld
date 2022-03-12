//
//  ContentView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct QuizGame: View {
    @StateObject var triviaManager = TriviaManager()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {

        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                Spacer()
                NavigationView {
                    VStack(spacing: 40) {
                        VStack(spacing: 20) {
                            Text("Trivia Game")
                                .greenTitle()
                        }

                        NavigationLink {
                            TriviaView()
                                .environmentObject(triviaManager)
                        } label: {
                            Text("Let's Go!")
                                .foregroundColor(Color.matrixGreen)

                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black)
                }
                Spacer()
                Button {
                    viewRouter.currentPage = .rabbitHoleHub
                } label: {
                    Text("Go Back to Hub")
                        .padding(8)
                        .foregroundColor(Color.matrixGreen)
                        .border(Color.matrixGreen, width: 0.5)
                }

                Spacer()
            }
        }
    }
}

struct QuizGame_Previews: PreviewProvider {
    static var previews: some View {
        QuizGame()
    }
}
