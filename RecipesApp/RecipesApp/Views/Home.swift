//
//  Home.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @State var search = ""
    @State var selectedTab = "Home"
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("Button Pressed!")
                }) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .cornerRadius(16)
                }
            } //: HSTACK
            .padding([.horizontal,.bottom])
            .padding(.top,10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 15) {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search Recipe", text: $search)
                        } //: HSTACK
                        .padding()
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(15)
                        
                        Button(action: {
                            print("Button Pressed!")
                        }) {
                            Image("filter")
                                .renderingMode(.original)
                                .padding()
                                .background(Color("yellow").opacity(0.2))
                                .cornerRadius(15)
                        }
                    } //: HSTACK
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Top Recipes")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    } //: HSTACK
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(recipes,id: \.title) { recipe in
                                RecipeCard(recipe: recipe)
                            }
                        } //: HSTACK
                        .padding(.horizontal)
                    } //: SCROLLVIEW
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories,id: \.self) { title in
                                CategoryCard(title: title)
                            }
                        } //: HSTACK
                        .padding()
                    } //: SCROLLVIEW
                } //: VSTACK
            } //: SCROLLVIEW
            
            CustomTabBar(selectedTab: $selectedTab)
        } //: VSTACK
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
