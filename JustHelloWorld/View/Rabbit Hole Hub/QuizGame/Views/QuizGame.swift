//
//  ContentView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct QuizGame: View {
    @StateObject var triviaManager = TriviaManager()

    var body: some View {

        ZStack {
            Color.black
                .ignoresSafeArea()

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
        }
    }
}

struct QuizGame_Previews: PreviewProvider {
    static var previews: some View {
        QuizGame()
    }
}
