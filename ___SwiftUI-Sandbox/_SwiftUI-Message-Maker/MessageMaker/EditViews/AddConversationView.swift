//
//  AddConversationView.swift
//  
//
//  Created by Ryan Lintott on 2020-07-09.
//

import SwiftUI

struct AddConversationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var conversationData: ConversationData
    @State private var draftName: String = ""
    @State private var draftText: String = ""
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("Add Conversation")
            .navigationBarItems(leading: Button("Cancel") {
                    self.cancel()
                }, trailing: Button("Save") {
                    self.save()
                }
            )
        }
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if let messageGroups = MessageGroups(rawValue: draftText) {
            let conversation = Conversation(name: draftName, messageGroups: messageGroups)
            conversationData.add(conversation)
            presentationMode.wrappedValue.dismiss()
        } else {
            print("error saving conversation")
            // error saving conversation
        }
    }
}

struct AddConversationView_Previews: PreviewProvider {
    static var previews: some View {
        AddConversationView(conversationData: .example)
    }
}
