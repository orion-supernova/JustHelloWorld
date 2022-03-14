//
//  TerminalChatViewModel.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 13.03.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    var context: String
    var sender: String
    var senderUID: String
    var date: Timestamp
}

class TerminalChatViewModel: ObservableObject {
    @Published var messages = [Message]()

    init() {
        fetchMessages()
    }

    func fetchMessages(completion: (() -> Void)? = nil) {

        COLLECTION_CHATROOMS.document("publicChatRoom").collection("chatroom-messages").order(by: "date", descending: false).addSnapshotListener {[weak self] snapshot, error in
            guard let self = self else { return }
            guard error == nil else { print(error!.localizedDescription); return }
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.messages.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Message.self)}))
        }
    }

    func uploadMessage(messageText: String) {

        let data = ["sender": AppGlobal.shared.username ?? "",
                    "senderUID": AppGlobal.shared.userID ?? "",
                    "date": Timestamp(date: Date()),
                    "context": messageText] as [String: Any]
        
        COLLECTION_CHATROOMS.document("publicChatRoom").collection("chatroom-messages").addDocument(data: data) { error in
            if error != nil {
                AlertHelper.basicAlertMessage(title: "Error", message: error!.localizedDescription)
                print("Failed to upload comment. \(error!.localizedDescription)")
            }
        }
    }
}
