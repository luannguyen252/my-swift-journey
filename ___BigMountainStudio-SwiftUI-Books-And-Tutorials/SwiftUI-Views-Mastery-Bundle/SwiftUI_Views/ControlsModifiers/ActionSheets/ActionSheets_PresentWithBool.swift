//
//  ActionSheets_PresentWithBool.swift
//  100Views
//
//  Created by Mark Moeykens on 8/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ActionSheets_PresentWithBool: View {
    // 1. Create a State variable to control presenting the action sheet
    @State private var presentingActionSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Presenting with Bool")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("By changing a State variable, you can trigger the ActionSheet to show.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Button("Show ActionSheet") {
                // 2. Change the State variable to trigger presenting the action sheet
                self.presentingActionSheet = true
            }
            // 3. Use the actionSheet function to listen to the State variable for changes and return an ActionSheet object when true
        }.actionSheet(isPresented: $presentingActionSheet) {
            // Remember, the return keyword is optional for single expressions
            ActionSheet(title: Text("My Action Sheet"))
        }
    }
}

struct ActionSheets_PresentWithBool_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheets_PresentWithBool()
    }
}
