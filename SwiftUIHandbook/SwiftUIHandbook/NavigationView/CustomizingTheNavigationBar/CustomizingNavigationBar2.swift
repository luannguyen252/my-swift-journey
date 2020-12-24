//
//  CustomizingNavigationBar2.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar2: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
        Text("Hello, SwiftUI!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Title").font(.headline)
                        Text("Subtitle").font(.subheadline)
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar2_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar2()
    }
}
