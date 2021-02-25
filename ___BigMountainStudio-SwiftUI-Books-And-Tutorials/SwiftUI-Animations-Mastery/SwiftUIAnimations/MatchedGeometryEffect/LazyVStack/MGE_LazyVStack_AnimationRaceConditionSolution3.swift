//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_AnimationRaceConditionSolution3: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Race Condition Solution #3")
            BannerText("Use individual animations with each matchedGeometryEffect.", backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(items) { item in
                        HStack {
                            if item.id != selectedFruit?.id {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: item.id, in: namespace)
                                    // Closing Animation
                                    .animation(.spring(response: 0.35, dampingFraction: 0.7))
                                    .frame(width: 50, height: 36)
                                    .zIndex(1)
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
                            selectedFruit = item
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

struct MGE_LazyVStack_AnimationRaceConditionSolution3_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item? = Item(name: "Blackberries",
                                                  imageName: "Blackberries")
    
    static var previews: some View {
        Group {
            MGE_LazyVStack_AnimationRaceConditionSolution3()
            
            MGEFruitDetailView(namespace: ns, selectedFruit: $selectedFruit,
                               fruitInfo: selectedFruit!)
        }
    }
}
