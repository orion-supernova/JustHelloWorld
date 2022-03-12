//
//  LoginScreen.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 11.02.2022.
//

import SwiftUI

struct LoginScreen: View {

    @State var mainText = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showLogin = false

    @EnvironmentObject var viewRouter: ViewRouter
    @State var isLoading = false
    @ObservedObject var keyboardResponder = KeyboardResponder()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            if isLoading {
               LoaderView()
            }

            VStack {
                Spacer()
                    .frame(width: getRect().width, height: 20)
                HStack {
                    Text(mainText)
                        .minimumScaleFactor(0.01)
                        .foregroundColor(Color.matrixGreen)
                        .font(.system(size: getDeviceType() == .smallest ? 16 : 20, weight: .bold, design: .monospaced))
                    Spacer()

                }
                .onAppear {
                    let text = "If you take the exit, story ends. If you stay here and enter, you should figure out the rest."
                    var charArray = [String]()
                    var target = 0
                    var count = 0
                    for char in text {
                        target += 1
                        charArray.append("\(char)")
                    }
                    Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
                        if count < target {
                            mainText += charArray[count]
                            count += 1
                        } else {
                            count = 0
                            charArray = []
                            timer.invalidate()
                            withAnimation {
                                showLogin = true
                            }
                        }
                    }
                }
                if showLogin {
                    VStack {
                        Image("door")
                            .resizable()
                            .scaledToFill()
                            .frame(maxHeight: 200)
                        VStack(spacing: 20) {
                            if AppGlobal.shared.userID != nil {
                                Text("You've already logged in")
                                    .foregroundColor(Color.matrixGreen)
                                    .padding(10)
                                    .cornerRadius(2)
                                Button {
                                    viewRouter.currentPage = .matrixRainView
                                } label: {
                                    Text("Enter the Rabbit Hole")
                                        .foregroundColor(Color.matrixGreen)
                                        .padding(10)
                                        .border(Color.init(hexString: "202020"), width: 1)
                                        .cornerRadius(2)
                                }

                            } else {
                                // MARK: - Email Field
                                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                                    .frame(width: getRect().width, height: 30)
                                    .foregroundColor(Color.matrixGreen)

                                // MARK: - Password Field
                                CustomSecureField(text: $password, placeholder: Text("Password "))
                                    .frame(width: getRect().width, height: 30)
                                    .foregroundColor(Color.matrixGreen)

                                Button {
                                    if email == "" || password == "" {
                                        AlertHelper.basicAlertMessage(title: "Empty Field", message: "You can't enter without your credentials...")
                                        return
                                    }
                                    isLoading = true
                                    AuthManager.shared.startAuth(email: email, password: password) { success in
                                        self.isLoading = false
                                        if success {
                                            viewRouter.currentPage = .matrixRainView
                                        }
                                    }
                                } label: {
                                    Text("Enter The Rabbit Hole")
                                        .foregroundColor(Color.matrixGreen)
                                        .padding(10)
                                        .border(Color.init(hexString: "202020"), width: 1)
                                        .cornerRadius(2)
                                }
                            }
                        }
                        .offset(y: -60)
                        Spacer()
                        Divider()
                            .frame(width: getRect().width, height: 1)
                            .background(Color.init(hexString: "202020"))
                            .offset(y:-10)
                        HStack {
                            Button {
                                withAnimation {
                                    viewRouter.currentPage = .surpriseScreen
                                }
                            } label: {
                                Text("Go Back")
                                    .foregroundColor(Color.matrixGreen)
                                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                            }
                            Spacer()
                                .frame(maxWidth: 50)
                            Button {
                                withAnimation {
                                    viewRouter.currentPage = .mainScreen
                                }
                            } label: {
                                Text("Exit!")
                                    .foregroundColor(Color.matrixGreen)
                                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
