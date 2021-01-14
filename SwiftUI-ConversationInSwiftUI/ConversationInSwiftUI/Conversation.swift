//
//  Conversation.swift
//  ConversationInSwiftUI
//
//  Created by Toomas Vahter on 19.06.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let text: String
}

final class Conversation: ObservableObject {
    private let session = Session()
    private var messageSubscriber: AnyCancellable?
    
    init() {
        messageSubscriber = session.messageFeed.sink { [weak self] (receivedMessage) in
            self?.messages.append(receivedMessage)
        }
    }
    
    @Published private(set) var messages = [Message]()
    
    func send(_ message: Message) {
        session.send(message)
    }
}

fileprivate struct Session {
    let messageFeed = PassthroughSubject<Message, Never>()
    
    func send(_ message: Message) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.messageFeed.send(message)
            self.simulateReceivingMessages()
        }
    }
    
    private func simulateReceivingMessages() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            let receivedMessage = Message(sender: "Person B", text: UUID().uuidString)
            self.messageFeed.send(receivedMessage)
        }
    }
}

