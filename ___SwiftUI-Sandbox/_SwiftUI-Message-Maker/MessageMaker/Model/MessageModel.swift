//
//  MessageModel.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

enum Sender: String, Codable {
    case me
    case other
    
    mutating func toggle() {
        switch self {
        case .me:
            self = .other
        case .other:
            self = .me
        }
    }
}

enum MessageType: String, Codable {
    case iMessage
    case sms
}

struct Message: Identifiable, Codable {
    typealias RawValue = String
    
    let id = UUID()
    var sender: Sender
    var type: MessageType = .iMessage
    var text: String
    var timeStamp: TimeStamp?
    
    mutating func addTimeStamp(_ timeStamp: TimeStamp) {
        self.timeStamp = timeStamp
    }
    
    var isBigEmoji: Bool {
        text.count < 6 && text.containsOnlyEmoji
    }
    
    var rawValue: RawValue {
        var rawArray = [String]()
        rawArray.append(text)
        if let timeStamp = timeStamp {
            rawArray.append(timeStamp.rawValue)
        }
        return rawArray.joined(separator: .newLine)
    }
    
    static let examples = (
        meSmall: Message(sender: .me, text: "Hi"),
        meMedium: Message(sender: .me, text: "Hello, here is a longer message"),
        meLarge: Message(sender: .me, text: "Here is a really long string. There's a bunch of words in here!"),
        meEmoji: Message(sender: .me, text: "😄"),
        otherSmall: Message(sender: .other, text: "Hi"),
        otherMedium: Message(sender: .other, text: "Hello, here is a longer message"),
        otherLarge: Message(sender: .other, text: "Here is a really long string. There's a bunch of words in here!"),
        otherEmoji: Message(sender: .other, text: "😄☝️")
    )
}



