//
//  CategoryCard.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CategoryCard: View {
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Image(title)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(Color("orange"))
        } //: VSTACK
        .padding(.vertical)
        .padding(.horizontal, 10)
        .background(Color("yellow").opacity(0.2))
        .clipShape(Capsule())
    }
}
