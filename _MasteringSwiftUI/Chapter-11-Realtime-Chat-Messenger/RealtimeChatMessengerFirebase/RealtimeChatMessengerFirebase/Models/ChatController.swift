//
//  ChatController.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import Combine
import SwiftUI

class ChatController: ObservableObject {
    // Hold the chat messages for ChatView
    var messages = [ChatMessage]()
    
    /*
     The objectWillChange property needs to be assigned to a PassthroughSubject, which is part of the Combine framework.
     The PassthroughSubject  passes its data to any view that’s observing whenever the objectWillChange property gets called.
     The first parameter inside the “<>” is the data that gets passed; in our case, that should be the ChatController.
     The second parameter can be used for setting a rule when an error should be thrown; in our case, that should never be the case.
     */
    let objectWillChange = PassthroughSubject<ChatController,Never>()
    
    // Send messages to the Firebase database
    func sendMessage(messageText: String) {
        let newChat = databaseChats.childByAutoId()
        let messageToSend = ["username": UserDefaults.standard.string(forKey: "username") ?? "Unknown user", "messageText": messageText]
        newChat.setValue(messageToSend)
    }
    
    // Receive messages from the Firebase database
    func receiveMessages() {
        // Query for the last 100 messages of inside our chats node
        let query = databaseChats.queryLimited(toLast: 100)
        
        // Observe Firebase database
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            if  let data = snapshot.value as? [String: String],
                let retrievedUsername = data["username"],
                let retrievedMessageText = data["messageText"],
                !retrievedMessageText.isEmpty {
                let retrievedMessage = ChatMessage(messageText: retrievedMessageText, username: retrievedUsername)
                self?.messages.append(retrievedMessage)
                self?.objectWillChange.send(self!)
            }
        })
    }
}
