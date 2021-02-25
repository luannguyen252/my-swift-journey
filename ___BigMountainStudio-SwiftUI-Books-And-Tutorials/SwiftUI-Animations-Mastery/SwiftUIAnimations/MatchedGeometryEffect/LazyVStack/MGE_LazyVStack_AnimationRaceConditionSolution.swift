//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_AnimationRaceConditionSolution: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    @State private var isDisabled = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Race Condition Solution")
            BannerText("Use the onAppear and onDisappear of the detail view to control the disabling and enabling of views.", backColor: .green, textColor: .black)
            
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
                            selectedFruit = item
                        }
                    }
                }
            }
            .blur(radius: selectedFruit != nil ? 3 : 0)
            .disabled(isDisabled)
            .overlay(
                Group {
                    // Detail View
                    if let fruitInfo = selectedFruit {
                        MGEFruitDetailView(namespace: namespace,
                                           selectedFruit: $selectedFruit,
                                           fruitInfo: fruitInfo)
                            .onAppear{ isDisabled.toggle() }
                            .onDisappear{ isDisabled.toggle() }
                    }
                }
            )
        }
        .animation(.easeInOut(duration: 2))
        //        .animation(.spring(dampingFraction: 0.5)) // try different animations
    }
}

struct MGE_LazyVStack_AnimationRaceConditionSolution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_AnimationRaceConditionSolution()
    }
}
