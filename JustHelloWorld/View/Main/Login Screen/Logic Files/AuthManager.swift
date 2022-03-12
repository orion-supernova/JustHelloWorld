//
//  AuthManager.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 12.03.2022.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI

class AuthManager: ObservableObject {
    static let shared = AuthManager()

    private var verificationID: String?

    func startAuth(email: String, password: String, completion: @escaping (Bool) -> Void) {
        COLLECTION_USERS.getDocuments { [weak self] snapshot, error in
            guard error == nil else { return }
            guard let self = self else { return }
            guard let snapshot = snapshot else { return }
            let documents = snapshot.documents
            if documents.isEmpty {
                self.register(withEmail: email, password: password) { success in
                    if success {
                        completion(true)
                    }
                    completion(false)
                }
            } else {
                var documentDict = [String: Any]()
                for document in documents {
                    documentDict = document.data()
                    if let email = documentDict["email"] as? String {
                        self.login(withEmail: email, password: password) { success in
                            if success {
                                completion(true)
                            }
                            completion(false)
                        }
                    } else {
                        self.register(withEmail: email, password: password) { success in
                            if success {
                                completion(true)
                            }
                        }
                    }
                }
            }
        }
    }

    func register(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Failed to create user. \(error!.localizedDescription)")
                AlertHelper.basicAlertMessage(title: "Failed", message: error!.localizedDescription)
                completion(false)
                return
            } else {
                guard let user = result?.user else { return }
                print("Successfully created user")

                let data = ["email": email,
                            "uid": user.uid]
                COLLECTION_USERS.document(user.uid).setData(data) { error in
                    print("Sucessfully uploaded user data!")
                    AppGlobal.shared.userID = user.uid
                    completion(true)
                }
            }
        }
    }

    func login(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Failed to sign in \(error!.localizedDescription)")
                AlertHelper.basicAlertMessage(title: "Failed", message: error!.localizedDescription)
                completion(false)
                return
            }
            AppGlobal.shared.userID = result?.user.uid
            completion(true)
        }
        print("Login")
    }

    func signOut(completion: @escaping () -> Void) {
        try? Auth.auth().signOut()
        print("logout")
        completion()
    }
}
