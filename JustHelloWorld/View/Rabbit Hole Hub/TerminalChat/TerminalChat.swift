//
//  TerminalChat.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import SwiftUI
import Firebase

struct TerminalChat: View {
    @State var username = AppGlobal.shared.username
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewModel = TerminalChatViewModel()
    @State var messageText = ""
    @State var isKeyboardOpen = false
    @State var scrollIndex = 0
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
                                AlertHelper.alertMessage(title: "Logout", message: "Do you want to logout and exit from the rabbit hole?") { _ in
                                    AppGlobal.shared.userID = nil
                                    viewRouter.currentPage = .mainScreen
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
                            viewRouter.currentPage = .rabbitHoleHub
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
                        .frame(maxHeight: 50)

                    // MARK: - Main Content
                    VStack(spacing: 0) {
                        ScrollViewReader { proxy in
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 5) {
                                    ForEach(Array(viewModel.messages.enumerated()), id: \.offset) { index, message in
                                        TerminalChatCell(message: message)
                                            .id(index)
                                    }
                                }
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                                        scrollIndex = viewModel.messages.count
                                    })
                                }
                                .padding(.vertical, 10)

                            }
                            .onChange(of: scrollIndex, perform: { newValue in
                                proxy.scrollTo(newValue-1, anchor: .bottom)
                            })
                            .border(Color.matrixGreen, width: 0.5)
                            .frame(width: getRect().width)

                        }

                        // MARK: - Message Input View
                        KeyboardInputView(text: $messageText, action: uploadMessage)
                            .onTapGesture {
                                scrollIndex = viewModel.messages.count
                                isKeyboardOpen = true
                            }
                    }
                }
            }
            .onTapGesture {
//                if isKeyboardOpen {
//                    isKeyboardOpen = false
//                    UIApplication.shared.endEditing()
//                }
                isKeyboardOpen = false
                UIApplication.shared.endEditing()
            }
        }
    
    func uploadMessage() {
        viewModel.uploadMessage(messageText: messageText)
        messageText = ""
        scrollIndex = viewModel.messages.count
    }
}

struct TerminalChat_Previews: PreviewProvider {
    static var previews: some View {
        TerminalChat()
    }
}
