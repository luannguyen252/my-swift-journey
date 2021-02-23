//
//  MessageGroupModel.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-07-09.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

enum MessageGroupError: Error {
    case noMessages
}

struct MessageGroup: Codable, Identifiable {
    let id = UUID()
    var timeStampHeader = TimeStamp(label: nil, time: "")
    var messages = [Message]()
    
    var isEmpty: Bool {
        messages.count == 0 && timeStampHeader.isEmpty
    }
    
    mutating func timeStampLastMessage(_ timeStamp: TimeStamp) throws {
        if messages.count > 0 {
            messages[messages.count - 1].addTimeStamp(timeStamp)
        } else {
            throw MessageGroupError.noMessages
        }
    }
    
    static let example = MessageGroup(timeStampHeader: TimeStamp.example, messages: [
        Message.examples.meLarge,
        Message.examples.otherMedium,
        Message.examples.meSmall,
        Message.examples.otherEmoji
    ])
}

typealias MessageGroups = [MessageGroup]

extension MessageGroups: RawRepresentable {
    public typealias RawValue = String
    
    public init?(rawValue: RawValue) {
        var messageGroups = [MessageGroup]()
        var currentMessageGroup = MessageGroup()
        var currentSender: Sender = .me
        
        let lines = rawValue.components(separatedBy: .newlines)
        for (index, line) in lines.enumerated() {
            // Blank line
            guard line.trimmingCharacters(in: .whitespaces).count > 0 else {
                // if following line is timestamp
                if index + 1 < lines.count && TimeStamp(rawValue: lines[index + 1]) != nil {
                    if !currentMessageGroup.isEmpty {
                        messageGroups.append(currentMessageGroup)
                        currentMessageGroup = MessageGroup()
                    }
                } else {
                    currentSender.toggle()
                }
                continue
            }
            
            if let timeStamp = TimeStamp(rawValue: line) {
                if currentMessageGroup.isEmpty {
                    currentMessageGroup.timeStampHeader = timeStamp
                } else {
                    try? currentMessageGroup.timeStampLastMessage(timeStamp)
                }
            } else {
                let message = Message(sender: currentSender, text: line)
                currentMessageGroup.messages.append(message)
            }
        }
        if !currentMessageGroup.isEmpty {
            messageGroups.append(currentMessageGroup)
        }
        self = messageGroups
    }
    
    public var rawValue: String {
        var rawArray = [String]()
        for messageGroup in self {
            var rawMessageGroupArray = [String]()
            let timeStamp = messageGroup.timeStampHeader
            rawMessageGroupArray.append(timeStamp.isEmpty ? TimeStamp().rawValue : timeStamp.rawValue)
            
            var currentSender: Sender = .me
            for message in messageGroup.messages {
                if message.sender != currentSender {
                    rawMessageGroupArray.append("")
                    currentSender.toggle()
                }
                rawMessageGroupArray.append(message.rawValue)
            }
            rawArray.append(rawMessageGroupArray.joined(separator: .newLine))
        }
        return rawArray.joined(separator: .newLine)
    }
    
    static let timeRegex = try! NSRegularExpression(pattern: #"\(.+\)"#)
        
    static func removingTimeCode(from text: String) -> String {
        let range = NSRange(location: 0, length: text.utf16.count)
        return Self.timeRegex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "").trimmingCharacters(in: .whitespaces)
    }
    
    static let example = MessageGroups(rawValue: exampleRawText)!
    static let exampleLong = MessageGroups(rawValue: exampleRawTextLong)!
}
