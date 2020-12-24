//
//  TabButton.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var title: String
    @Binding var selectedTab: String
    
    // MARK: - BODY
    var body: some View{
        Button(action: {selectedTab = title}) {
            HStack(spacing: 10) {
                Image(title)
                    .renderingMode(.template)
                
                Text(title)
                    .fontWeight(.semibold)
            } //: HSTACK
            .foregroundColor(selectedTab == title ? Color("yellow") : .gray)
            .padding(.vertical,10)
            .padding(.horizontal,15)
            .background(Color("yellow").opacity(selectedTab == title ? 0.15 : 0))
            .clipShape(Capsule())
        }
    }
}
