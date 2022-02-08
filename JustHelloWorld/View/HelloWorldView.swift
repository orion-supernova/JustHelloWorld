//
//  HelloWorldView.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct HelloWorldView: View {
    @State var bgColor = Color.random
    @State var textColor = Color.random

    @Binding var randomBGColor: Bool
    @Binding var randomTextColor: Bool
    @Binding var randomLanguage : Bool
    @Binding var isAutomatic : Bool

    let textArray = [
        "Hello, world!","","","","","","","","","","","","","","","",
    ]
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()

            Text("Hello, world!")
                .foregroundColor(textColor)
                .padding(5)
                .font(.system(size: 80, weight: .bold, design: .monospaced))
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .onTapGesture {
            if randomBGColor {
                bgColor = Color.random
            }
            if randomTextColor {
                textColor = Color.random
            }
        }
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldView(randomBGColor: .constant(true), randomTextColor: .constant(true), randomLanguage: .constant(true), isAutomatic: .constant(true))
    }
}
