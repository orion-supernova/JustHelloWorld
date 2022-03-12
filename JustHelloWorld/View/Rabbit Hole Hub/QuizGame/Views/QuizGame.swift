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
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .greenTitle()

                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(Color.red)
                }

                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct QuizGame_Previews: PreviewProvider {
    static var previews: some View {
        QuizGame()
    }
}
