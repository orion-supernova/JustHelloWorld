//
//  CustomTextField.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 11.02.2022.
//

import SwiftUI

struct CustomTextField: View {

    @Binding var text: String
    let placeholder: Text
    let imageName: String

    var body: some View {
        ZStack(alignment: .leading) {
            Color.black
                .ignoresSafeArea()

            if text.isEmpty {
                placeholder
                    .foregroundColor(Color.matrixGreen)
                    .padding(.leading, 40)
            }

            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.matrixGreen)

                TextField("", text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(10)
            .border(Color.init(hexString: "202020"), width: 1)

        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
