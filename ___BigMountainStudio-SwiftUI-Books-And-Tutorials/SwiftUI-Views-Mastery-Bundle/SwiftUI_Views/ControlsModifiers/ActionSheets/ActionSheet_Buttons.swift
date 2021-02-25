//
//  ActionSheet_Buttons.swift
//  100Views
//
//  Created by Mark Moeykens on 8/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ActionSheet_Buttons: View {
    @State private var presentingActionSheet = false
    
    var actionSheet =
        ActionSheet(
            title: Text("Action Sheet Title"),
            buttons: [
                .default(
                    Text("Default Button")
                        .font(.title)
                        .foregroundColor(.purple)
                    , action: {
                        // Default Button code
                }),
                .destructive(Text("Destructive Button"), action: {
                    // Destructive Button code
                }),
                .cancel(Text("Exit"), action: {
                    // Cancel Button code
                })
        ])
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Buttons")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The buttons are not customizable. You use the Text view for inside the button but you cannot even customize this. You can change the text of the Cancel button.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Button("Show ActionSheet") {
                self.presentingActionSheet = true
            }
            Spacer()
            
        }.actionSheet(isPresented: $presentingActionSheet) {
            self.actionSheet
        }
    }
}

struct ActionSheet_Buttons_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_Buttons()
    }
}
