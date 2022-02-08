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
    @State var text = Text("Hello, World!")

    @StateObject var viewmodel: SettingsViewModel
    @State var resetTextLanguage = false
    
    var body: some View {
        ZStack {
            if viewmodel.settingsObject.isBlackAndWhite {
                Color.init(hexString: "7f7f7f")
                    .ignoresSafeArea()
            } else {
                bgColor
                    .ignoresSafeArea()
            }

            text
                .foregroundColor(viewmodel.settingsObject.isBlackAndWhite ? Color.init(hexString: "1e1e1e") : textColor)
                .padding(5)
                .font(.system(size: 80, weight: .bold, design: .monospaced))
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .onTapGesture {
            if viewmodel.settingsObject.changeBGCColor {
                bgColor = Color.random
            }
            if viewmodel.settingsObject.changeTextColor {
                textColor = Color.random
            }
            if viewmodel.settingsObject.changeTextLanguage {
                text = Text.random
            }
        }
        .onLongPressGesture(perform: {
            AlertHelper.alertMessage(title: "You've triggered the text.", message: "Do you want to reset the text to \"Hello, World!\"?") { _ in
                text = Text("Hello, World!")
            }
        })
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldView(viewmodel: SettingsViewModel())
    }
}
