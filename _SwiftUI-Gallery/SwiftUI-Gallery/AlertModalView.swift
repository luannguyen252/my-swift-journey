//
//  AlertModalView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct AlertModalView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Open")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Title"),
                  message: Text("Optional Message"),
                  primaryButton: .destructive(Text("Primary Button")),
                  secondaryButton: .cancel())
        }
    }
}

struct AlertModalView_Previews: PreviewProvider {
    static var previews: some View {
        AlertModalView()
    }
}
