//
//  Alert_PassDataInto.swift
//  100Views
//
//  Created by Mark Moeykens on 8/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

// 1. Create an Identifiable struct to hold the alert data
struct AlertData: Identifiable {
    var id = UUID() // Conform to Identifiable
    let title: String
    let message: String
}

struct Alert_PassDataInto: View {
    // 2. Create State var for the alert data
    @State private var alertData: AlertData? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Alert").font(.largeTitle)
            Text("Passing Data Into").font(.title).foregroundColor(.gray)
            Text("You may need to pass data into your Alert. For this scenario, you use a different function to attach an Alert to the view.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.green)

            Button("Show Alert with Data") {
                // 3. Making the Identifiable State var not nil will
                //    trigger showing the alert
                self.alertData = AlertData(title: "Warning",
                                           message: "<field> is required")
            }
            Spacer()
        }
            // 4. Attach alert to the view and observe the Identifiable
            //    State var for changes from nil to a non-nil value
        .alert(item: $alertData) { alertData in
            // 5. Return an Alert with your data
            Alert(title: Text(alertData.title),
                  message: Text(alertData.message))
        }
    }
}

struct Alert_PassDataInto_Previews: PreviewProvider {
    static var previews: some View {
        Alert_PassDataInto()
    }
}
