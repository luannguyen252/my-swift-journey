//
//  ContentView.swift
//  Avacados
//
//  Created by Sandesh on 15/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK:- PROPERTIES
    var headers: [Header] = headerData
    var facts: [Fact] = factData
    var recipes: [Recipe] = recipeData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //MARK:- HEADER
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                        
                    }
                } .font(.system(.title, design: .serif))
                                       .foregroundColor(Color("ColorGreenAdaptive"))
                
                //MARK:- DISHES VIEW
                Text("Avocado Dishes")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                DishesView()
                    .frame(maxWidth: 640)
                //MARK:- AVOCADO FACTS
                
                Text("Avocado facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { item in
                            FactsView(fact: item)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing,20)
                }
                
                //MARK:- RECIPE CARDS
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                //MARK: - FOOTER
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    Text("Every thing you wanted to know about avocados but were too afraid to ask")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headerData, facts: factData, recipes: recipeData)
            .previewDevice(.init(stringLiteral: "iPad Pro"))
    }
}
