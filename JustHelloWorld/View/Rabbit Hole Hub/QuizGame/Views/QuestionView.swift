//
//  QuestionView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .greenTitle()

                Spacer()

                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color.matrixGreen)
                    .fontWeight(.heavy)
            }

            ProgressBar(progress: triviaManager.progress)

            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }

            Button {
                triviaManager.goToNextQuestion()
            } label: {
                Text("Next")
                    .foregroundColor(triviaManager.answerSelected ? Color.matrixGreen : Color.black)
                    .padding()
                    .padding(.horizontal)
                    .background(triviaManager.answerSelected ? Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327) : Color.black )
                    .cornerRadius(30)
                    .shadow(radius: 10)

            }
            .disabled(!triviaManager.answerSelected)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.black)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
