//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_GridToDetail_AnimationSolution: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let fruits = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 10.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Animation Solution")
            BannerText("Let's disable the background, add a blur, and change the closing animation.", backColor: .green, textColor: .black)
            
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
                                }
                                .matchedGeometryEffect(id: fruit.id, in: namespace)
                                .animation(.spring(response: 0.35, dampingFraction: 0.7))
                                .zIndex(1)
                            }
                        }
                        .frame(height: 100)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .blur(radius: selectedFruit != nil ? 3 : 0)
        .disabled(selectedFruit != nil)
        .overlay(
            Group {
                if let fruit = selectedFruit {
                    MGE_GridDetailView(namespace: namespace, selectedFruit: $selectedFruit,
                                       fruitInfo: fruit)
                        .animation(.spring(dampingFraction: 0.7))
                }
            }
        )
    }
}

struct MGE_GridToDetail_AnimationSolution_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item? = Item(name: "Coconut",
                                                  imageName: "Coconut")
    
    static var previews: some View {
        Group {
            MGE_GridToDetail_AnimationSolution()
            
            MGE_GridDetailView(namespace: ns, selectedFruit: $selectedFruit, fruitInfo: selectedFruit!)
                .previewLayout(.sizeThatFits)
        }
    }
}
