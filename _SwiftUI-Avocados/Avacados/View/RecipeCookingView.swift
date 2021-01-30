//
//  RecipeCookingView.swift
//  Avacados
//
//  Created by Sandesh on 29/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct RecipeCookingView: View {
    //MARK:- PROPERTIES
    var recipe: Recipe
    var body: some View {
       HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipeData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
