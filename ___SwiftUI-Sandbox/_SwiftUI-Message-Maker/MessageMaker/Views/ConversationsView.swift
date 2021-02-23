//
//  ConversationsView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-07-08.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct ConversationsView: View {
    @ObservedObject var conversationData: ConversationData
    @State private var showingAddConversationView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<conversationData.conversations.count, id: \.self) { i in
                    NavigationLink(destination: ConversationView(conversation: self.$conversationData.conversations[i])) {
                        Text(self.conversationData.conversations[i].name)
                    }

                }
                .onDelete(perform: conversationData.remove)
            }
            .navigationBarTitle("Conversations")
            .navigationBarItems(leading: EditButton(), trailing: Button("Add") {
                self.showingAddConversationView = true
            })
            .sheet(isPresented: $showingAddConversationView) {
                AddConversationView(conversationData: self.conversationData)
            }
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView(conversationData: .example)
    }
}
