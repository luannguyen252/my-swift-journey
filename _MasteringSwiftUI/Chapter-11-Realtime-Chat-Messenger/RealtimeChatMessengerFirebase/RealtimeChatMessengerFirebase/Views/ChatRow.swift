//
//  ChatRow.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ChatRow: View {
    // MARK: - PROPERTIES
    let message: ChatMessage
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // Check if the message is me
            if message.isMe {
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(message.username)
                    .font(.footnote)
                    .foregroundColor(message.isMe ? Color("LightGrayColor") : .gray)
                
                Text(message.messageText)
                    .font(.body)
                    .foregroundColor(message.isMe ? .white : .black)
                    .lineLimit(nil)
            } //: VSTACK
            .padding(10)
            .background(message.isMe ? Color.blue : Color("LightGrayColor"))
            .cornerRadius (10)
            .frame(maxWidth: 280, alignment: message.isMe ? .trailing : .leading)
            
            // Check if the message not me
            if !message.isMe {
                Spacer()
            }
        }
        .padding()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: ChatMessage(messageText: "Hello", username: "Not me"))
    }
}
#endif
