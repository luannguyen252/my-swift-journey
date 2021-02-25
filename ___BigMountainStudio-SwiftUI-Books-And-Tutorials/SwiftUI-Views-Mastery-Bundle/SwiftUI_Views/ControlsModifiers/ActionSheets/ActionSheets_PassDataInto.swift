//
//  ActionSheets_PassDataInto.swift
//  100Views
//
//  Created by Mark Moeykens on 8/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

// 1. Create an Identifiable struct to hold the action sheet data
struct ActionSheetData: Identifiable {
    var id = UUID() // Conform to Identifiable
    let title: String
    let message: String
}

struct ActionSheets_PassDataInto: View {
    // 2. Create State var for the action sheet data
    @State private var actionSheetData: ActionSheetData? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Passing Data Into")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You may need to pass data into your ActionSheet. For this scenario, you use a different function to attach an ActionSheet to the view.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Button("Show ActionSheet with Data") {
                // 3. Making the Identifiable State var not nil will trigger showing the action sheet
                self.actionSheetData = ActionSheetData(title: "Options", message: "Choose an option:")
            }
        }
            // 4. Attach action sheet to view and observe the Identifiable State var for changes from nil to a non-nil value
            .actionSheet(item: $actionSheetData) { actionSheetMessage in
                
                // 5. Return an ActionSheet with your data
                ActionSheet(title: Text(actionSheetMessage.title),
                            message: Text(actionSheetMessage.message))
        }
    }
}

struct ActionSheets_PassDataInto_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheets_PassDataInto()
    }
}
