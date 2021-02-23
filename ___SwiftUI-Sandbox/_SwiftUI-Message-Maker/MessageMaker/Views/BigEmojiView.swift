//
//  EmojiView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct BigEmojiView: View {
    let emojiText: String
    
    var body: some View {
        Text(emojiText)
            .font(.system(size: 50))
            .padding(2)
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BigEmojiView(emojiText: "😄")
                .previewLayout(.sizeThatFits)
            
            BigEmojiView(emojiText: "😄👍")
                .previewLayout(.sizeThatFits)
        }
    }
}
