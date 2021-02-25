//
//  ActionSheet_Parts.swift
//  100Views
//
//  Created by Mark Moeykens on 8/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ActionSheet_Intro: View {
    @State private var presentingActionSheet = false
    
    var actionSheet =
        ActionSheet(
            title: Text("Action Sheet Title"),
            message: Text("Action Sheet Message"),
            buttons: [
                .default(Text("Default Button"), action: {
                    // Default Button code
                }),
                .destructive(Text("Destructive Button"), action: {
                    // Destructive Button code
                }),
                .cancel()
        ])
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The ActionSheet view holds all the parts of an action sheet in one object to be presented.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Button("Show ActionSheet") {
                presentingActionSheet = true
            }
            Spacer()
            
        }.actionSheet(isPresented: $presentingActionSheet) {
            // Which ActionSheet do you want to return?
            // Remember, the return keyword is optional for single expressions
            actionSheet
        }
    }
}

//struct ActionSheet_Intro_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionSheet_Intro()
//    }
//}

struct ActionSheet_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_Intro()
    }
}
