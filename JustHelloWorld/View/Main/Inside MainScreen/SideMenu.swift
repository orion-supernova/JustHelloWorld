//
//  SideMenu.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import SwiftUI

struct SideMenu: View {
    // MARK: - Stored Properties
    @State var bgColor = Color.random
    @State var randomBGColorToggleBackground = Color.random
    @State var randomTextColorToggleBackground = Color.random
    @State var randomLanguagToggleBackground = Color.random
    @State var isAutomaticToggleBackground = Color.random
    @State var resetButtonBGColor = Color.random

    @State var settingsTextColor = Color.random
    @State var randomBGColorToggleTextColor = Color.random
    @State var randomTextColorToggleTextColor = Color.random
    @State var randomLanguagToggleTextColor = Color.random
    @State var isAutomaticToggleTextColor = Color.random
    @State var resetButtonTextColor = Color.random

    @StateObject var viewmodel: SettingsViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    //MARK: - Body View
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Settings: \(viewmodel.settingsObject.isBlackAndWhite ? "B&W" : "Default")")
                    .font(.system(size:20, weight: .bold, design: .monospaced))
                    .foregroundColor(settingsTextColor)
                    .frame(width: getRect().maxX, height: 50)
                Toggle("Change Background Color", isOn: $viewmodel.settingsObject.changeBGCColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomBGColorToggleTextColor)
                    .padding()
                    .background(randomBGColorToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: viewmodel.settingsObject.changeBGCColor ? Color.random : Color.green))
                    .disabled(viewmodel.settingsObject.isBlackAndWhite)
                Toggle("Change Text Color", isOn: $viewmodel.settingsObject.changeTextColor)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomTextColorToggleTextColor)
                    .padding()
                    .background(randomTextColorToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: viewmodel.settingsObject.changeBGCColor ? Color.random : Color.green))
                    .disabled(viewmodel.settingsObject.isBlackAndWhite)
                Toggle("Change \"Hello, World\" Language", isOn:
                        $viewmodel.settingsObject.changeTextLanguage)
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(randomLanguagToggleTextColor)
                    .padding()
                    .background(randomLanguagToggleBackground)
                    .cornerRadius(10)
                    .toggleStyle(SwitchToggleStyle(tint: viewmodel.settingsObject.isBlackAndWhite ? Color.gray : viewmodel.settingsObject.changeBGCColor ? Color.random : Color.green))
//                Toggle("Change Automatically", isOn:
//                        $viewmodel.settingsObject.isAutomatic)
//                    .font(.system(size: 15, weight: .bold, design: .monospaced))
//                    .foregroundColor(isAutomaticToggleTextColor)
//                    .padding()
//                    .background(isAutomaticToggleBackground)
//                    .cornerRadius(10)
//                    .toggleStyle(SwitchToggleStyle(tint: viewmodel.settingsObject.changeBGCColor ? Color.random : Color.green))
//                    .disabled(viewmodel.settingsObject.isBlackAndWhite)
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            viewmodel.settingsObject.isBlackAndWhite = false

                            // Enable Change
                            viewmodel.settingsObject.changeBGCColor = true
                            viewmodel.settingsObject.changeTextColor = true
                            viewmodel.settingsObject.changeTextLanguage = false
                            viewmodel.settingsObject.isAutomatic = false

                            // Random Colors
                            bgColor = Color.random

                            randomBGColorToggleBackground = Color.random
                            randomTextColorToggleBackground = Color.random
                            randomLanguagToggleBackground = Color.random
                            isAutomaticToggleBackground = Color.random
                            resetButtonBGColor = Color.random

                            settingsTextColor = Color.random
                            randomBGColorToggleTextColor = Color.random
                            randomTextColorToggleTextColor = Color.random
                            randomLanguagToggleTextColor = Color.random
                            isAutomaticToggleTextColor = Color.random
                            resetButtonTextColor = Color.random
                        } label: {
                            ZStack {
                                if viewmodel.settingsObject.isBlackAndWhite {
                                    Text("D").foregroundColor(Color.init(hexString: "FF0000")) +
                                    Text("e").foregroundColor(Color.init(hexString: "FF7F00")) +
                                    Text("f").foregroundColor(Color.init(hexString: "FFFF00")) +
                                    Text("a").foregroundColor(Color.init(hexString: "00FF00")) +
                                    Text("u").foregroundColor(Color.init(hexString: "FF7F00")) +
                                    Text("l").foregroundColor(Color.init(hexString: "9400D3")) +
                                    Text("t").foregroundColor(Color.init(hexString: "FF0000"))
                                } else {
                                    Text("Default")
                                }
                            }
                            .padding(5)
                            .foregroundColor(resetButtonTextColor)
                            .background(resetButtonBGColor)
                            .cornerRadius(10)
                        }

                        Spacer()

                        Button {
                            viewmodel.settingsObject.isBlackAndWhite = true

                            // Disable Change
                            viewmodel.settingsObject.changeBGCColor = false
                            viewmodel.settingsObject.changeTextColor = false
                            viewmodel.settingsObject.changeTextLanguage = false
                            viewmodel.settingsObject.isAutomatic = false

                            // B&W Colors
                            bgColor = Color.init(hexString: "4f4f4f")

                            randomBGColorToggleBackground = Color.init(hexString: "1e1e1e")
                            randomTextColorToggleBackground = Color.init(hexString: "1e1e1e")
                            randomLanguagToggleBackground = Color.init(hexString: "1e1e1e")
                            isAutomaticToggleBackground = Color.init(hexString: "1e1e1e")
                            resetButtonBGColor = Color.init(hexString: "1e1e1e")

                            settingsTextColor = Color.init(hexString: "262626")
                            randomBGColorToggleTextColor = Color.init(hexString: "7f7f7f")
                            randomTextColorToggleTextColor = Color.init(hexString: "7f7f7f")
                            randomLanguagToggleTextColor = Color.init(hexString: "7f7f7f")
                            isAutomaticToggleTextColor = Color.init(hexString: "7f7f7f")
                            resetButtonTextColor = Color.init(hexString: "7f7f7f")

                        } label: {
                            Text("B&W")
                                .padding(5)
                                .foregroundColor(Color.init(hexString: "7f7f7f"))
                                .background(Color.init(hexString: "1e1e1e"))
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                Spacer()
                VStack {
                    HStack {
                        // MARK: - Surprise Button
                        Button {
                            AlertHelper.alertMessage(title: "U SURE?", message: "You tapped the surprise button. From now on, I won't be responsible for whats happening.") { yes in
                                withAnimation {
                                    viewRouter.currentPage = .surpriseScreen
                                }
                            }
                        } label: {
                            Text("👾")
                        }
                        Spacer()
                    }
                    .padding()
                }

            }
            .frame(width: 210, height: getRect().maxY)
            .padding(.horizontal)
        }
        .onTapGesture {

            // MARK: - Whole View Tapped Action
            //Change BG Colors
            if viewmodel.settingsObject.changeBGCColor {
                // View
                bgColor = Color.random

                // Button
                randomBGColorToggleBackground = Color.random
                randomTextColorToggleBackground = Color.random
                randomLanguagToggleBackground = Color.random
                isAutomaticToggleBackground = Color.random
                resetButtonBGColor = Color.random
            }

            // Change TextColors
            if viewmodel.settingsObject.changeTextColor {
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
        SideMenu(viewmodel: SettingsViewModel())
    }
}
