//
//  SideMenu.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct SideMenu: View {
    // Booleans
    @Binding var randomBGColor: Bool
    @Binding var randomTextColor: Bool
    @Binding var randomLanguage : Bool
    @Binding var isAutomatic : Bool

    // BG Colors
    @State var bgColor = Color.random
    @State var sideMenuBGColor = Color.random

    @State var randomBGColorToggleBackground = Color.random
    @State var randomTextColorToggleBackground = Color.random
    @State var randomLanguagToggleBackground = Color.random
    @State var isAutomaticToggleBackground = Color.random
    @State var resetButtonBGColor = Color.random

    // Text Colors
    @State var settingsTextColor = Color.random

    @State var randomBGColorToggleTextColor = Color.random
    @State var randomTextColorToggleTextColor = Color.random
    @State var randomLanguagToggleTextColor = Color.random
    @State var isAutomaticToggleTextColor = Color.random
    @State var resetButtonTextColor = Color.random


    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Settings")
                    .font(.system(size:20, weight: .bold, design: .monospaced))
                    .foregroundColor(settingsTextColor)
                    .frame(width: getRect().maxX, height: 50)
                Toggle("Change Background Color", isOn: $randomBGColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomBGColorToggleTextColor)
                    .padding()
                    .background(randomBGColorToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: Color.random))
                Toggle("Change Text Color", isOn: $randomTextColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomTextColorToggleTextColor)
                    .padding()
                    .background(randomTextColorToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: Color.random))
                Toggle("Change \"Hello, World\" Language", isOn:
                        $randomLanguage)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomLanguagToggleTextColor)
                    .padding()
                    .background(randomLanguagToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: Color.random))
                Toggle("Change Automatically", isOn:
                        $isAutomatic)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(isAutomaticToggleTextColor)
                    .padding()
                    .background(isAutomaticToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: Color.random))
                Button {
                    //
                } label: {
                    Text("Reset Settings")
                        .padding(5)
                        .foregroundColor(Color.random)
                        .background(Color.random)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .frame(width: 210, height: getRect().maxY)
            .padding(.horizontal)
        }
        .onTapGesture {

            //Change BG Colors
            if randomBGColor {
                // View
                bgColor = Color.random
                sideMenuBGColor = Color.random

                // Button
                randomBGColorToggleBackground = Color.random
                randomTextColorToggleBackground = Color.random
                randomLanguagToggleBackground = Color.random
                isAutomaticToggleBackground = Color.random
                resetButtonBGColor = Color.random
            }

            // Change TextColors
            if randomTextColor {
                settingsTextColor = Color.random
                randomBGColorToggleTextColor = Color.random
                randomTextColorToggleTextColor = Color.random
                randomLanguagToggleTextColor = Color.random
                isAutomaticToggleTextColor = Color.random
                resetButtonTextColor = Color.random
            }
        }
        .frame(width: 220, height: getRect().maxY)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(randomBGColor: .constant(true), randomTextColor: .constant(true), randomLanguage: .constant(false), isAutomatic: .constant(false))
    }
}
