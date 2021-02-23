//
//  ConversationView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct ConversationView: View {
    @Binding var conversation: Conversation
    @State private var showingEditView = false
    @State private var screenShotMode = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    ForEach(0..<conversation.messageGroups.count, id: \.self) { i in
                        MessageGroupView(messageGroup: self.conversation.messageGroups[i])
                    }
                    
                    NavigationLink(
                        destination: EditConversationView(conversation: self.$conversation),
                        isActive: $showingEditView
                    ) {
                        EmptyView()
                    }.isDetailLink(false)
                }
            }
            .onTapGesture {
                self.screenShotMode.toggle()
            }
            
            if !screenShotMode {
                HStack {
                    Button(action: {
                        self.screenShotMode = true
                    }, label: {
                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                    })
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle(Text(conversation.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.showingEditView = true
            }, label: {
                Text("Edit")
            })
        )
        .navigationBarHidden(screenShotMode)
//        .edgesIgnoringSafeArea(screenShotMode ? .all : [])
//        .statusBar(hidden: screenShotMode)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
//                Image("iphone11_messages_screenshot")
//                    .offset(x: 0, y: 39)
//    //                .offset(x: 290, y: 325) // Emoji offset
//                    .opacity(0.5)
//                    .edgesIgnoringSafeArea(.all)

                ConversationView(conversation: .constant(.exampleLong))
            }
        }
    }
}
