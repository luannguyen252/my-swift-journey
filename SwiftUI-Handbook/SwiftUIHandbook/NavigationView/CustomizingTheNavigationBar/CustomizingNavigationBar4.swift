//
//  CustomizingNavigationBar4.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar4: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
        Text("Hello, SwiftUI!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Title").font(.headline)
                        Button("Subtitle") {
                            
                        }
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar4_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar4()
    }
}
