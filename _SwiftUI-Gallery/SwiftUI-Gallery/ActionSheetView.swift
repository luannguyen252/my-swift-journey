//
//  ActionSheetView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct ActionSheetView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Open")
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("What action?"),
                        message: Text("Pick one"),
                        buttons: [ .default(Text("Option 1"))
                            , .default(Text("Option 2"))
                            , .cancel()
                        ])
        }
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
