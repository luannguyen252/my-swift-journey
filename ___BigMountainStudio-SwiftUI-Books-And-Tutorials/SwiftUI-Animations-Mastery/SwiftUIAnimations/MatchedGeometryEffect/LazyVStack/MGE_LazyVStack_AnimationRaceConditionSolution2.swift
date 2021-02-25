//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_AnimationRaceConditionSolution2: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Race Condition Solution #2")
            BannerText("Use withAnimation when row is selected.", backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(items) { item in
                        HStack {
                            if item.id != selectedFruit?.id {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: item.id, in: namespace)
                                    .frame(width: 50, height: 36)
                                    .zIndex(1) // Puts image above the text
                            } else {
                                Color.clear
                                    .frame(width: 50, height: 36)
                            }
                            
                            Text(item.name)
                                .font(.title)
                            
                            Spacer()
                        }
                        .padding()
                        .onTapGesture {
                            withAnimation(.spring(dampingFraction: 0.7)) {
                                selectedFruit = item
                            }
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
                        // This will still cause unexpected results
                        // .animation(.spring(dampingFraction: 0.7)) // Open Animation
                    }
                }
            )
        }
    }
}

struct MGE_LazyVStack_AnimationRaceConditionSolution2_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_AnimationRaceConditionSolution2()
    }
}
