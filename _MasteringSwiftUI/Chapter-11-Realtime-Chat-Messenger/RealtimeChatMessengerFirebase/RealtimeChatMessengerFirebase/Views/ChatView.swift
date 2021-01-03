//
//  ChatView.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ChatView: View {
    // MARK: - PROPERTIES
    @State var newMessageInput = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - CHAT MESSAGES + SCROLLVIEW
                ScrollView {
                    ForEach(sampleConversation, id: \.messageID) { message in
                        ChatRow(message: message)
                    }
                }
                
                Spacer()
                
                // MARK: - BOX MESSAGE INPUT
                ZStack {
                    // Background
                    Rectangle()
                        .foregroundColor(.white)
                    
                    // Border Rounded
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("LightGrayColor"), lineWidth: 2)
                        .padding()
                    
                    // Message Input and Send Button
                    HStack {
                        // Message Input
                        TextField("New message...", text: $newMessageInput, onCommit: {
                            print("Send Message")
                        })
                        .padding(30)
                        
                        // Send Button
                        Button(action: {
                            print("Send message.")
                        }) {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .padding(30)
                        }
                    }
                } //: ZSTACK
                .frame(height: 70)
            } //: VSTACK
            .navigationTitle("Chat App")
        } //: NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
#endif
