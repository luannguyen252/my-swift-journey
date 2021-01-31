//
//  CustomizingNavigationBar1.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar1: View {
    // MARK: - PROPERTIES
    @State private var fullScreen = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Button("Toggle Full Screen") {
                self.fullScreen.toggle()
            }
            .navigationBarTitle("Full Screen")
            .navigationBarHidden(fullScreen)
        }
        .statusBar(hidden: fullScreen)
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar1_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar1()
    }
}
