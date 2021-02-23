//
//  ContentView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-13.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ConversationsView(conversationData: ConversationData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
