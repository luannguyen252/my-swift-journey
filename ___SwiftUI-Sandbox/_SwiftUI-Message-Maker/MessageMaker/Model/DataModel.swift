//
//  DataModel.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-07-08.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

class ConversationData: ObservableObject {
    @Published var conversations: [Conversation] {
        didSet {
            save()
        }
    }
    
    private let saveKey = "Conversations"
    
    init(conversations: [Conversation]) {
        self.conversations = conversations
    }
    
    init() {
        self.conversations = UserDefaults.standard.decode([Conversation].self, forKey: saveKey) ?? [.example]
    }
    
    func add(_ conversation: Conversation) {
        objectWillChange.send()
        conversations.append(conversation)
        save()
    }
    
    func remove(at offsets: IndexSet) {
        objectWillChange.send()
        conversations.remove(atOffsets: offsets)
        save()
    }
    
    func save() {
        UserDefaults.standard.encode(conversations, forKey: saveKey)
    }
    
    static let example = ConversationData(conversations: [
        .example,
        .exampleLong,
        Conversation(name: "Another Conversation", messageGroups: .example),
        Conversation(name: "Funny Stuff", messageGroups: .example)
    ])
}
