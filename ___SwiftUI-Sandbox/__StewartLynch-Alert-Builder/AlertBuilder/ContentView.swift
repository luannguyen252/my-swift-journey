//
//  ContentView.swift
//  AlertBuilder
//
//  Created by Stewart Lynch on 2021-02-28.
//

import SwiftUI

struct ContentView: View {
    @State private var alertType: AlertType? = nil
    var body: some View {
        VStack {
            Button("Title Only") {
                alertType = .ok(title: "This is an alert")
            }
            Button("Title and Message") {
                alertType = AlertType.ok(title: "Title Here",
                                         message: "This is a message")
            }
            Button("Single Button (Title and Message)") {
                alertType = AlertType.singleButton(title: "Congratulations",
                                                   message: "Process Completed",
                                                   dismissButton: Alert.Button.default(Text("OK")) {
                                                    // some action
                                                   })
            }
            Button("Two Buttons (no message)") {
                alertType = AlertType.twoButtons(title: "Delete Profile",
                                                 primaryButton: .destructive(Text("OK")) {
                                                    // actiion here
                                                 },
                                                 secondaryButton: .cancel())
            }
        }
        .alert(item: $alertType) { $0.alert}
        .buttonStyle(GreenButtonStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


