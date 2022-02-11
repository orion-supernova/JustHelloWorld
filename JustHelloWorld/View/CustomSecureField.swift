//
//  CustomSecureField.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 11.02.2022.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text

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
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.matrixGreen)

                SecureField("", text: $text)
            }
            .padding(10)
            .border(Color.init(hexString: "202020"), width: 1)

        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: Text("Hm"))
    }
}
