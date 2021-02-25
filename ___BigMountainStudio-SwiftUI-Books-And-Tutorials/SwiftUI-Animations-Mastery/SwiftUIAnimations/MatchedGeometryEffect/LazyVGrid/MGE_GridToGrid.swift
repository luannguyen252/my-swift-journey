//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_GridToGrid: View {
    @State private var fruits = Data.getFruits()
    @State private var selectedFruits: [Item] = []
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 10.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("With Grids")
            BannerText("Using the matched geometry effect to move views from one grid to another.", backColor: .green)
            
            Text("Select Fruit")
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(fruits) { fruit in
                        Button(action: {
                            fruits.removeAll { $0.id == fruit.id }
                            selectedFruits.append(fruit)
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.green)
                                .overlay(Image(fruit.imageName).resizable().scaledToFit().frame(height: 50))
                                .matchedGeometryEffect(id: fruit.id, in: namespace)
                                .frame(height: 100)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Text("Fruit Selected")
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(50))]) {
                    ForEach(selectedFruits) { fruit in
                        Button(action: {
                            selectedFruits.removeAll { $0.id == fruit.id }
                            fruits.append(fruit)
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .overlay(Image(fruit.imageName).resizable().scaledToFit().frame(height: 50))
                                .matchedGeometryEffect(id: fruit.id, in: namespace)
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .font(.title)
        .animation(.easeIn)
    }
}

struct MGE_GridToGrid_Previews: PreviewProvider {
    static var previews: some View {
        MGE_GridToGrid()
    }
}
