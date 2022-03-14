//
//  TerminalChatCell.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 13.03.2022.
//

import SwiftUI
import Firebase

struct TerminalChatCell: View {
    var messageDateString: String? {
        return message.date.timestampToString()
    }

    let message: Message

    var body: some View {
        VStack {
            HStack {
                Text("\(message.sender): \(message.context)")
                Spacer()
            }

            HStack {
                Spacer()
                Text((messageDateString == "0sn" ? "now" : messageDateString) ?? "")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
            }
        }
        .foregroundColor(Color.matrixGreen)
        .padding(.horizontal, 5)
    }
}

struct TerminalChatCell_Previews: PreviewProvider {
    static var previews: some View {
        TerminalChatCell(message: Message.init(id: "", context: "hmm", sender: "hede", senderUID: "", date: Timestamp(date: Date())))
    }
}
