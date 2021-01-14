//
//  AlertView.swift
//  UIControls
//
//  Created by Sud on 6/21/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct AlertView : View {
    @State var showActionSheet = false
    @State var showAlert = false
    
    var body: some View {
        List {
            Section {
                Button(action: {
                    self.showActionSheet.toggle()
                }) {
                    Text("Show ActionSheet")
                }
                .actionSheet(isPresented:  $showActionSheet) {
                    ActionSheet(title: Text("Showing ActionSheet"),
                                message: Text("Message"),
                                buttons: [Alert.Button.default(Text("OK")),
                                          Alert.Button.cancel(),
                                          Alert.Button.destructive(Text("Delete"))])
                }
            }
            Section {
                Button(action: {
                    self.showAlert.toggle()
                }) {
                    return Text("Show Alert")
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Showing Alert"),
                          message: Text("Message"),
                          primaryButton: Alert.Button.default(Text("OK")),
                          secondaryButton: Alert.Button.cancel())
                }
            }
        }
        .navigationBarTitle(Text("Alert and Action Sheet"))
    }
}

#if DEBUG
struct AlertView_Previews : PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
#endif
