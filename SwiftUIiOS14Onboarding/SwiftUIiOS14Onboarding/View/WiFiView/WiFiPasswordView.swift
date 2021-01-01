//
//  WiFiPasswordView.swift
//  SwiftUIiOS14Onboarding
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI
import SwiftUIX

struct WiFiPasswordView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @State var password = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                CocoaTextField("Password", text: $password)
                    .isFirstResponder(true)
            }
            .navigationBarTitle("Enter Password", displayMode: .inline)
            .navigationBarItems(leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("Cancel")
                    .font(.body)
            }, trailing: Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("Join")
            })
        }
    }
}

#if DEBUG
struct WiFiPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        WiFiPasswordView()
    }
}
#endif
