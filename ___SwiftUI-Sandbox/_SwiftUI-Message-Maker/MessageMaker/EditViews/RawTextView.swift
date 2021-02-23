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
    @State var draftText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                MultilineTextView(text: $draftText)
                    .font(.headline)
                    .padding()
            }
            .navigationBarTitle("Raw Text")
            .navigationBarItems(leading: Button("Cancel") {
                    self.cancel()
                }, trailing: Button("Save") {
                    self.save()
                }
            )
        }
        .onAppear(perform: createDraft)
    }
    
    func createDraft() {
        draftText = conversation.rawValue
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if let conversation = Conversation(rawValue: draftText) {
            self.conversation = conversation
        } else {
            // error saving conversation
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct RawTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditConversationView(text: .constant("""
            Here is a long string that will take up several lines.
            one
            two
            three

            and even more

            --- break ---

            and more
            """
        ))
    }
}


