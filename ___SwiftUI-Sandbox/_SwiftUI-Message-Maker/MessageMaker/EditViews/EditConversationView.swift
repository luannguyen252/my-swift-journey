//
//  RawTextView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct EditConversationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var conversation: Conversation
    @State private var draftName: String = ""
    @State private var draftText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Name", text: $draftName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            MultilineTextView(text: $draftText, fontSize: 16)
                .padding(4)
                .border(Color.secondary, width: 1)
        }
        .padding()
        .navigationBarTitle("Edit Conversation")
        .navigationBarItems(leading: Button("Cancel") {
                self.cancel()
            }, trailing: Button("Save") {
                self.save()
            }
        )
        .onAppear(perform: createDraft)
    }
    
    func createDraft() {
        draftName = conversation.name
        draftText = conversation.messageGroups.rawValue
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if let messageGroups = MessageGroups(rawValue: draftText) {
            conversation.name = draftName
            conversation.messageGroups = messageGroups
        } else {
            print("error saving conversation")
            // error saving conversation
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct RawTextView_Previews: PreviewProvider {
    struct PreviewData: View {
        @State private var conversation = Conversation.example
        
        var body: some View {
            EditConversationView(conversation: $conversation)
        }
    }
        
    static var previews: some View {
        NavigationView {
            PreviewData()
        }
    }
}


