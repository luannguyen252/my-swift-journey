//
//  MessagesView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    let messages: [Message]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<messages.count, id:\.self) { i in
                MessagesRowView(message: self.messages[i], hasTail: self.applyTail(toIndex: i))
            }
        }
        .padding(.horizontal, 20)
    }
    
    func applyTail(toIndex i: Int) -> Bool {
        if i + 1 < messages.count {
            if messages[i].sender == messages[i + 1].sender && messages[i].timeStamp == nil {
                return false
            }
        }
        return true
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(messages: MessageGroup.example.messages)
    }
}
