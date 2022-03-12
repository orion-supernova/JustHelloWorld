//
//  TerminalChat.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI

struct TerminalChat: View {
    @State var username = AppGlobal.shared.username
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(maxHeight: 10)
                    // MARK: - Top Username View
                    HStack {
                        Button {
                            AlertHelper.textFieldAlert(title: "Enter your username", message: "") { str in
                                username = str
                            }
                        } label: {
                            Text("Username: \(username ?? "Not Configured")")
                                .foregroundColor(Color.matrixGreen)
                        }

                        Spacer()
                        Button {
                            AuthManager.shared.signOut {
                                AlertHelper.alertMessage(title: "Logout", message: "Do you want to logout?") { _ in
                                    AppGlobal.shared.userID = nil
                                    viewRouter.currentPage = .loginScreen
                                }
                            }
                        } label: {
                            Text("Logout")
                                .padding(5)
                                .foregroundColor(Color.matrixGreen)
                        }

                        Text("|")
                            .foregroundColor(Color.matrixGreen)

                        Button {
                            AuthManager.shared.signOut {
                                AlertHelper.alertMessage(title: "Exit", message: "Do you want to exit from the rabbit hole?") { _ in
                                    viewRouter.currentPage = .mainScreen
                                }
                            }
                        } label: {
                            Text("Exit")
                                .padding(5)
                                .foregroundColor(Color.matrixGreen)
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .padding(8)
                    .border(Color.matrixGreen, width: 0.5)

                    Spacer()
                        .frame(maxHeight: 200)

                    // MARK: - Main Content
                    Text("In Progress...")
                        .foregroundColor(Color.matrixGreen)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))

                    Spacer()
                }
            }
        }
}

struct TerminalChat_Previews: PreviewProvider {
    static var previews: some View {
        TerminalChat()
    }
}
