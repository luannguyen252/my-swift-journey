//
//  Alert Button Options.swift
//  100Views
//
//  Created by Mark Moeykens on 8/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Alert_Button_Options: View {
    @State private var presentingAlert = false
    // If you forget your button options, just type in "Alert.Button." and autocomplete will show you your available options.
    
    var alert0 =
        Alert(title: Text("Your session has timed out"))
    
    var alert1 =
        Alert(title: Text("Title"),
              message: Text("Message of the Alert"),
              dismissButton: Alert.Button.cancel())
    
    var alert2 =
        Alert(title: Text("Confirm"),
              message: Text("Are you sure you want to continue?"),
              primaryButton: .default(Text("Continue"), action: {
                // Continue code
              }),
              secondaryButton: .cancel({
                // Cancel code
              }))
    
    var alert3 =
        Alert(title: Text("Delete"),
              message: Text("Are you sure you want to delete?"),
              primaryButton: .destructive(Text("Delete"), action: {
                // Delete code
              }),
              secondaryButton: .cancel(Text("No"), action: { }))
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Alert")
                .font(.largeTitle)
            
            Text("Button Options")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Here are different combinations of buttons")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.green)
            
            Button("Show Alert") {
                self.presentingAlert = true
            }
            Spacer()
        }.alert(isPresented: $presentingAlert) {
            // Change to show different alerts:
            alert3
        }
    }
}

struct Alert_Button_Options_Previews: PreviewProvider {
    static var previews: some View {
        Alert_Button_Options()
    }
}
