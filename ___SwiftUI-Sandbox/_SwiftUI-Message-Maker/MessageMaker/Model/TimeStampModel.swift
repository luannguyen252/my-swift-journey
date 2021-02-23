//
//  TimeStampModel.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

struct TimeStamp: Codable, RawRepresentable {
    typealias RawValue = String
    static var timeStampPrefix = "< "
    static var timeStampSuffix = " >"
    static var separator: Character = "|"
    
    var label: String?
    var time: String
    
    init?(rawValue: RawValue) {
        if rawValue.hasPrefix(Self.timeStampPrefix) && rawValue.hasSuffix(Self.timeStampSuffix) {
            let trimmedText = rawValue.deletingPrefix(Self.timeStampPrefix).deletingSuffix(Self.timeStampSuffix).trimmingCharacters(in: .whitespaces)
            if trimmedText.count > 0 {
                let components = trimmedText.split(separator: Self.separator)
                
                if components.count > 1 {
                    self.label = String(components[0])
                    self.time = String(components[1])
                } else {
                    self.time = trimmedText
                }
                return
            }
        }
        return nil
    }
    
    var rawValue: RawValue {
        var rawArray = [String]()
        rawArray.append(Self.timeStampPrefix)
        if let label = label {
            rawArray.append(label + String(Self.separator))
        }
        rawArray.append(time)
        rawArray.append(Self.timeStampSuffix)
        return rawArray.joined()
    }
    
    init(label: String? = nil, time: String = "") {
        self.label = label
        self.time = time
    }
    
    var isEmpty: Bool {
        time.count == 0 && (label == nil || label?.count == 0)
    }
    
    static let example = TimeStamp(label: "Sat, May 24,", time: "11:09 AM")
    static let exampleFromRawText = TimeStamp(rawValue: "< Sat, May 24,| 12:00 PM >")
}
