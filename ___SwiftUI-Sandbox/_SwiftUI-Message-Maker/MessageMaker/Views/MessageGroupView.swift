//
//  MessageGroupView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct MessageGroupView: View {
    let messageGroup: MessageGroup
    
    var body: some View {
        VStack(spacing: 0) {
            TimeStampView(timeStamp: messageGroup.timeStampHeader)
            
            MessagesView(messages: messageGroup.messages)
                .padding(.top, 8)
        }
    }
}

struct MessageGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image("iphone11_messages_screenshot")
                .offset(x: 0, y: 39)
//                .offset(x: 290, y: 325) // Emoji offset
                .opacity(0.0)
                .edgesIgnoringSafeArea(.all)
            
            MessageGroupView(messageGroup: MessageGroup.example)
        }
    }
}
