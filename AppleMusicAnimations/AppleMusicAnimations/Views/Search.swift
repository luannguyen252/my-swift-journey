//
//  Search.swift
//  AppleMusicAnimations
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Search: View {
    // MARK: - PROPERTIES
    @State var search = ""
    
    var columns = Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)

    // MARK: - BODY
    var body: some View {
        // Search View
        ScrollView {
            VStack(spacing: 18) {
                HStack {
                    Text("Search")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                } //: HSTACK
                
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                    
                    TextField("Search", text: $search)
                } //: HSTACK
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(15)
                // Grid View of Songs
                LazyVGrid(columns: columns,spacing: 20) {
                    ForEach(1...10,id: \.self) { index in
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // Two side padding = 30
                            // Spacing = 20
                            // Total = 50
                            .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                            .cornerRadius(15)
                    }
                } //: LAZYVGRID
                .padding(.top,10)
            } //: VSTACK
            .padding()
            // Padding miniplayer size as bottom
            .padding(.bottom,80)
        } //: SCROLLVIEW
    }
}
