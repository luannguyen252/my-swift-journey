//
//  ContentView.swift
//  Project12 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @StateObject var connectivity = Connectivity()

    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Response Text")
            Button("Message", action: sendMessage)
        }
    }

    // MARK: - SEND MESSAGE
    func sendMessage() {
        let data = ["text": "Hello from the watch"]
        connectivity.transferUserInfo(data)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
