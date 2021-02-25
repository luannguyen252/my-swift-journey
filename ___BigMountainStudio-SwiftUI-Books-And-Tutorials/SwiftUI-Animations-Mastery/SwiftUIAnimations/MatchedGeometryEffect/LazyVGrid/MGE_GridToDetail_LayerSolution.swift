//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_GridToDetail_LayerSolution: View {
    @State private var fruits = Data.getFruits()
    @State private var selectedFruit: Item?
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 10.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Layer Solution - Overlay")
            BannerText("Simply use the overlay modifier instead to fix the layer problem.", backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(fruits) { fruit in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15).fill(Color.green)
                            
                            if fruit.id != selectedFruit?.id {
                                Button(action: {
                                    selectedFruit = fruit
                                }) {
                                    Image(fruit.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .matchedGeometryEffect(id: fruit.id, in: namespace)
                                }
                            }
                        }
                        .frame(height: 100)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .overlay(
            Group {
                if let fruit = selectedFruit {
                    MGE_GridDetailView(namespace: namespace, selectedFruit:
                                        $selectedFruit, fruitInfo: fruit)
                }
            }
        )
        .animation(.spring(dampingFraction: 0.7))
    }
}

struct MGE_GridToDetail_LayerSolution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_GridToDetail_LayerSolution()
    }
}
