//
//  CategoryCard.swift
//  Recipes
//
//  Created by Balaji on 18/09/20.
//

import SwiftUI

struct CategoryCard: View {
    var title : String
    var body: some View {
        
        VStack(spacing: 20){
            
            Image(title)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(Color("orange"))
        }
        .padding(.vertical)
        .padding(.horizontal,10)
        .background(Color("yellow").opacity(0.2))
        .clipShape(Capsule())
    }
}
