//
//  Alert_Parts.swift
//  100Views
//
//  Created by Mark Moeykens on 8/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Alert_Intro: View {
    // 1. Create a State variable to control presenting the alert
    @State private var presentingAlert = false
    
    var alert =
        Alert(title: Text("Title"),
              message: Text("Message of the Alert"),
              primaryButton: .default(Text("Primary"), action: {
                // Primary Button code
              }),
              secondaryButton: Alert.Button.destructive(Text("Secondary"), action: {
                // Secondary Button code
              }))
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Alert")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The alert has a title, message and some buttons within one view. The message and buttons are optional.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.green)
            
            Button("Show Alert") {
                // 2. Change the State variable to trigger presenting the alert
                self.presentingAlert = true
            }
            Spacer()
            // 3. Use the alert function to listen to the State variable for changes and return an ActionSheet object when true
        }.alert(isPresented: $presentingAlert) {
            Alert(title: Text("Title"),
                  message: nil,
                  dismissButton: Alert.Button.cancel())
        }
    }
}

struct Alert_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Alert_Intro()
    }
}
