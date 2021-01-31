//
//  CustomizingNavigationBar5_DetailView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar5_DetailView: View {
    // MARK: - PROPERTIES
    var name: String
    
    // MARK: - BODY
    var body: some View {
        Text("current name is: \(name)")
        .navigationBarTitle(Text("Current Name"), displayMode: .inline)
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar5_DetailView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar5_DetailView(name: "")
    }
}
