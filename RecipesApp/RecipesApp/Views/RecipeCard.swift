//
//  RecipeCard.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct RecipeCard: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer(minLength: 0)
                
                Image(recipe.image)
            } //: HSTACK
            .padding(.bottom)
            
            Text(recipe.title)
                .font(.title2)
                .foregroundColor(.black)
            
            HStack(spacing: 12) {
                Label(title: {
                    Text(recipe.rating)
                        .font(.caption)
                        .foregroundColor(.gray)
                }) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(Color("orange"))
                }
                .padding(.vertical,5)
                .padding(.horizontal,10)
                .background(recipe.color.opacity(0.4))
                .cornerRadius(5)
                
                Text(recipe.type)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical,5)
                    .padding(.horizontal,10)
                    .background(recipe.color.opacity(0.4))
                    .cornerRadius(5)
            } //: HSTACK
            
            Text(recipe.detail)
                .foregroundColor(.gray)
                .lineLimit(3)
            
            HStack(spacing: 0) {
                ForEach(1...4,id: \.self) { i in
                    Image("p\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                        .offset(x: -CGFloat(i) * 8)
                }
                
                Text("25+ Likes")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, -(4) * 6)
            } //: HSTACK
            .padding(.bottom)
            
            HStack {
                Spacer(minLength: 0)
                Button(action: {
                    print("Button Pressed!")
                }) {
                    Label(title: {
                        Text("Save")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                    }) {
                        Image(systemName: "suit.heart.fill")
                            .font(.body)
                            .foregroundColor(Color("orange"))
                    }
                    .padding(.vertical,8)
                    .padding(.horizontal,10)
                    .background(Color.white)
                    .clipShape(Capsule())
                }
            } //: HSTACK
        } //: VSTACK
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width / 2)
        .background(
            recipe.color.opacity(0.2)
                .cornerRadius(25)
                .padding(.top,55)
                .padding(.bottom,15)
        )
    }
}
