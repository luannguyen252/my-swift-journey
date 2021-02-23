//
//  MessagesRowView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-13.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct MessageStyle {
    let alignment: HorizontalAlignment
    let textColor: Color
    let backgroundColor: Color
}


struct MessagesRowView: View {
    let message: Message
    let hasTail: Bool
    
    var messageStyle: MessageStyle {
        switch message.sender {
        case .me:
            return MessageStyle(
                alignment: .trailing,
                textColor: .white,
                backgroundColor: message.type == .sms ? .green : .blue
            )
        case .other:
            return MessageStyle(
                alignment: .leading,
                textColor: .black,
                backgroundColor: .init(red: 233/255, green: 233/255, blue: 234/255)
            )
        }
    }
    let farPadding: CGFloat = 89
    
    var body: some View {
        HStack {
            messageStyle.alignment == .leading ? nil : Spacer()
            
            VStack(alignment: messageStyle.alignment) {
                if message.isBigEmoji {
                    BigEmojiView(emojiText: message.text)
                } else {
                    TextBubbleView(
                        text: message.text,
                        messageAlignment: messageStyle.alignment,
                        textColor: messageStyle.textColor,
                        backgroundColor: messageStyle.backgroundColor,
                        hasTail: hasTail
                    )
                }
                
                if message.timeStamp != nil {
                    TimeStampView(timeStamp: message.timeStamp!)
                }
            }

            messageStyle.alignment == .trailing ? nil : Spacer()
        }
        .padding(.top, 1)
        .padding(.bottom, hasTail ? 8 : 1)
        .padding(.leading, messageStyle.alignment == .leading ? 0 : farPadding)
        .padding(.trailing, messageStyle.alignment == .trailing ? 0 : farPadding)
    }
}

struct MessagesRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessagesRowView(message: Message.examples.meEmoji, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
            
            MessagesRowView(message: Message.examples.otherEmoji, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
                
            MessagesRowView(message: Message.examples.meSmall, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
            
            MessagesRowView(message: Message.examples.otherMedium, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
            
            MessagesRowView(message: Message.examples.meMedium, hasTail: false)
                .previewLayout(.sizeThatFits)
                .padding()
            
            MessagesRowView(message: Message.examples.meLarge, hasTail: true)
                .previewLayout(.sizeThatFits)
                .padding()
        }
            
    }
}
