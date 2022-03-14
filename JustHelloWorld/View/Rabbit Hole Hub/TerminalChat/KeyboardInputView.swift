//
//  KeyboardInputView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 13.03.2022.
//

import SwiftUI

struct KeyboardInputView: View {

    @Binding var text: String
    var action: () -> Void

    var body: some View {

        VStack {
            Rectangle()
                .foregroundColor(Color.matrixGreen)
                .frame(width: UIScreen.main.bounds.width, height: 0.5)
                .padding(.bottom, 8)

            // hstack with send button and textfield
            HStack {
                TextField("Message...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)

                Button(action: {
                        action()
                }, label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(Color.matrixGreen)
                })
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        .foregroundColor(Color.matrixGreen)
    }
}

struct KeyboardInputView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardInputView(text: .constant("hm"), action: testFunction)
    }
}

func testFunction() {

}
