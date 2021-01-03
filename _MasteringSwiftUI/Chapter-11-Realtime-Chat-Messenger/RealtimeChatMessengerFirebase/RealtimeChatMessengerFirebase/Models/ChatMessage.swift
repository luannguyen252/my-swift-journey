//
//  ChatMessage.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - CHAT MESSAGE MODEL
struct ChatMessage: Hashable {
    let messageText: String
    let username: String
    let isMe: Bool
    let messageID = UUID()
}

// MARK: - CHAT MESSAGE SAMPLE
let sampleConversation = [
    ChatMessage(messageText: "Hello how are you?", username: "Me", isMe: true),
    ChatMessage(messageText: "I'm fine and you?", username: "Another user", isMe: false),
    ChatMessage(messageText: "I'm fine as well. Thanks for asking. What are you doing right now?", username: "Me", isMe: true),
    ChatMessage(messageText: "Do you have any vacation plans coming up?", username: "Another user", isMe: false),
    ChatMessage(messageText: "I'm thinking about going to Spain", username: "Me", isMe: true),
    ChatMessage(messageText: "What about you ?🤔", username: "Me", isMe: true),
    ChatMessage(messageText: "Sounds great!", username: "Another user", isMe: false),
    ChatMessage(messageText: "Thinking about flying to Sweden for christmas! 🎄", username: "Another user", isMe: false),
    ChatMessage(messageText: "I would love to go to Sweden one day!", username: "Me", isMe: true)
]
