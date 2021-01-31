//
//  DetailView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    var choice: String
    
    // MARK: - BODY
    var body: some View {
        Text("You chose \(choice)")
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(choice: "")
    }
}
