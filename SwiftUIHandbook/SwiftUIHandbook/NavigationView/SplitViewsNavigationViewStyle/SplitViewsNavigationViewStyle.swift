//
//  SplitViewsNavigationViewStyle.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct SplitViewsNavigationViewStyle: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("Primary")
            Text("Secondary")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct SplitViewsNavigationViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        SplitViewsNavigationViewStyle()
    }
}
