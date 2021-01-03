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
    
    // Make ChatView observe the ChatController
    @StateObject var chatController = ChatController()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - CHAT MESSAGES + SCROLLVIEW
                /*ScrollViewReader { scrollView in
                    ScrollView {
                        ForEach(sampleConversation, id: \.messageID) { message in
                            ChatRow(message: message)
                                .id(sampleConversation.firstIndex(of: message))
                        }
                        .onAppear(perform: {
                            scrollView.scrollTo(sampleConversation.count - 1)
                        })
                    }
                }*/
                ScrollViewReader { scrollView in
                    ScrollView {
                        ForEach(chatController.messages, id: \.messageID) { message in
                            ChatRow(message: message)
                                .id(chatController.messages.firstIndex(of: message))
                        }
                        .onAppear(perform: {
                            scrollView.scrollTo(chatController.messages.count-1)
                        })
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
                        /*TextField("New message...", text: $newMessageInput, onCommit: {
                            print("Send Message")
                        })*/
                        TextField("New message...", text: $newMessageInput, onCommit: {
                            guard !newMessageInput.isEmpty else {
                                print("New message input is empty.")
                                return
                            }
                            chatController.sendMessage(messageText: newMessageInput)
                            newMessageInput = ""
                        })
                        .padding(30)
                        
                        // Send Button
                        /*Button(action: {
                            print("Send message.")
                        }) {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .padding(30)
                        }*/
                        Button(action: {
                            guard !newMessageInput.isEmpty else {
                                print("New message input is empty.")
                                return
                            }
                            chatController.sendMessage(messageText: newMessageInput)
                            newMessageInput = ""
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
            // When have a message sent to the Firebase database, try to fetch that message and retrieve the username and content
            // When launch app, the receiveMessages function gets called which retrieves the stored message(s) from our database
            .onAppear {
                chatController.receiveMessages()
            }
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
