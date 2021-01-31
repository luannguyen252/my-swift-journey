//
//  CustomizingNavigationBar3.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar3: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
        Text("Hello, SwiftUI!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sun.min.fill")
                        Text("Title").font(.headline)
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar3_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar3()
    }
}
