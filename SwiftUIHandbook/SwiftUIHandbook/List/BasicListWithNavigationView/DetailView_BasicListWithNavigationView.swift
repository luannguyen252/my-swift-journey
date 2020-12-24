//
//  DetailView_BasicListWithNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct DetailView_BasicListWithNavigationView: View {
    // MARK: - PROPERTIES
    let discipline: String
    
    // MARK: - BODY
    var body: some View {
        Text(discipline)
            .navigationBarTitle(Text(discipline), displayMode: .inline)
    }
}

// MARK: - PREVIEW
struct DetailView_BasicListWithNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView_BasicListWithNavigationView(discipline: "")
    }
}
