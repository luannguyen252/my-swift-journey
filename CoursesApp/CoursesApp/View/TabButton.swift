//
//  TabButton.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var image: String
    @Binding var selectedTab : String
    
    // MARK: - BODY
    var body: some View {
        Button(action: { selectedTab = image }) {
            Image(image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color("link") : Color.black.opacity(0.4))
                .padding()
        }
    }
}
