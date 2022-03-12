//
//  TriviaView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .greenTitle()

                Text("Congratulations, you completed the game! 🥳")

                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")

                HStack {
                    Button {
                        Task.init {
                            await triviaManager.fetchTrivia()
                        }
                    } label: {
                        Text("Play Again")
                            .padding(5)
                            .border(Color.matrixGreen, width: 0.5)
                    }

                    Button {
                        viewRouter.currentPage = .rabbitHoleHub
                    } label: {
                        Text("Go Back to Hub")
                            .padding(5)
                            .border(Color.matrixGreen, width: 0.5)
                    }
                }
            }
            .foregroundColor(Color.matrixGreen)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
