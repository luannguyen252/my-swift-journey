//
//  ConversationModel.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

struct Conversation: Codable, Identifiable {
    let id: UUID
    var name: String
    var messageGroups: MessageGroups
    
    init(id: UUID = UUID(), name: String, messageGroups: MessageGroups = []) {
        self.id = id
        self.name = name
        self.messageGroups = messageGroups
    }
    
    static let example = Conversation(name: "Example", messageGroups: .example)
    static let exampleLong = Conversation(name: "Long Example", messageGroups: .exampleLong)
}


