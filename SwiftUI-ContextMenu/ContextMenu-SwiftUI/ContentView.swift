//
//  ContentView.swift
//  ContextMenu-SwiftUI
//
//  Created by Keerthi on 10/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct Chat: Identifiable {
    var id = UUID()
    var avatar: String
    var name: String
    var message: String
}

struct ContentView: View {
    var messages = [
        Chat(avatar: "A", name: "Arun", message: "Hi"),
        Chat(avatar: "B", name: "Banu", message: "Hello"),
        Chat(avatar: "C", name: "Cheran", message: "Welcome")
    ]
    
    init() {
         UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(messages) { message in
                ChatItem(message: message)
                    .contextMenu {
                        Button(action: {
                            // change country setting
                        }) {
                            Text("Contact Info")
                            Image(systemName: "globe")
                        }
                        
                        Button(action: {
                            // change country setting
                        }) {
                            Text("Clear Chat")
                            Image(systemName: "clear")
                        }
                        
                        Button(action: {
                            // enable geolocation
                        }) {
                            Text("Delete Chat")
                            Image(systemName: "trash")
                                .accentColor(.red)
                        }
                }
            }
        .navigationBarTitle("Chat")
        }

    }
}

struct ChatItem: View {
    var message: Chat
    var body: some View {
        HStack {
            ZStack {
                Circle().frame(width: 55, height: 55).foregroundColor(Color.gray)
                Text(message.avatar)
                    .font(.headline)
            }
            
            VStack(alignment: .leading) {
                Text(message.name)
                    .font(.headline)
                Text(message.message)
                .font(.caption)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
