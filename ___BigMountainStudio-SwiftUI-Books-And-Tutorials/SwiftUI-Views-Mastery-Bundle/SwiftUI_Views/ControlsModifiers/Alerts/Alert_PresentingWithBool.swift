//
//  Alert_PresentingWithBool.swift
//  100Views
//
//  Created by Mark Moeykens on 8/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Alert_PresentingWithBool: View {
    // 1. Create a State variable to control presenting the alert
    @State private var presentingAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Alert")
                .font(.largeTitle)
            
            Text("Presenting with Bool")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("By changing a State variable, you can trigger the Alert to show")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.green)
            
            Button("Show Alert") {
                // 2. Change the State variable to trigger presenting
                //    the alert
                self.presentingAlert = true
            }
            
            Spacer()
            
            // 3. Use the alert function to listen to the State variable for changes and return an ActionSheet object when true
        }.alert(isPresented: $presentingAlert) { () -> Alert in
            Alert(title: Text("Title of the Alert"))
        }
    }
}

struct Alert_PresentingWithBool_Previews: PreviewProvider {
    static var previews: some View {
        Alert_PresentingWithBool()
    }
}
