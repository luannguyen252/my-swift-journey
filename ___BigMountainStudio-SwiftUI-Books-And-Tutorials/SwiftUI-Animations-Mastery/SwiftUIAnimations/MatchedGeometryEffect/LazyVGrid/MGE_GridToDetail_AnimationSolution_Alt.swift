//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_GridToDetail_AnimationSolution_Alt: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let fruits = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Race Condition Solution #3")
            BannerText("Use individual animations with each matchedGeometryEffect.", backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(fruits) { fruit in
                        HStack {
                            if fruit.id != selectedFruit?.id {
                                Image(fruit.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: fruit.id, in: namespace)
                                    .animation(.spring(response: 0.35, dampingFraction: 0.7))
                                    .frame(width: 50, height: 36)
                                    .zIndex(1)
                            } else {
                                Color.clear
                                    .frame(width: 50, height: 36)
                            }
                            
                            Text(fruit.name)
                                .font(.title)
                            
                            Spacer()
                        }
                        .padding()
                        .onTapGesture {
                            selectedFruit = fruit
                        }
                    }
                }
            }
            .blur(radius: selectedFruit != nil ? 3 : 0)
            .disabled(selectedFruit != nil)
            .overlay(
                Group {
                    // Detail View
                    if let fruitInfo = selectedFruit {
                        MGEFruitDetailView(namespace: namespace,
                                           selectedFruit: $selectedFruit,
                                           fruitInfo: fruitInfo)
                            .animation(.spring(dampingFraction: 0.7)) // Open Animation
                    }
                }
            )
        }
    }
}

struct MGE_GridToDetail_AnimationSolution_Alt_Previews: PreviewProvider {
    static var previews: some View {
        MGE_GridToDetail_AnimationSolution_Alt()
    }
}
