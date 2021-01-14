//
//  ContentView.swift
//  ConversationInSwiftUI
//
//  Created by Toomas Vahter on 19.06.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject var conversation: Conversation
    
    var body: some View {
        NavigationView {
            VStack {
                List(self.conversation.messages) { message in
                    Text(message.text)
                }
                InputView(conversation: self.conversation)
            }.navigationBarTitle(Text("Conversation"))
        }
    }
}

struct InputView: View {
    let conversation: Conversation
    @State private var inputText = ""
    
    var body: some View {
        HStack {
            TextField("", text: $inputText)
                .padding(6)
                .background(Color.white)
            Button(action: sendMessage) {
                Text("Send")
            }
        }.padding(12).background(Color.init(white: 0.75))
    }
    
    private func sendMessage() {
        self.conversation.send(Message(sender: "PersonA", text: self.inputText))
        self.inputText = ""
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(conversation: Conversation())
    }
}
#endif


