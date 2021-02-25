//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_LayerSolutionWithOverlay: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("LazyVStack - Overlay Solution")
            BannerText("The overlay solution is a great option to avoid potential problems with ZStacks and zIndexes.", backColor: .green, textColor: .black)
            
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
            .overlay(
                Group {
                    // Detail View
                    if let fruitInfo = selectedFruit {
                        MGEFruitDetailView(namespace: namespace,
                                           selectedFruit: $selectedFruit,
                                           fruitInfo: fruitInfo)
                    }
                }
            )
        }
        .animation(.default)
    }
}

struct MGE_LazyVStack_LayerSolutionWithOverlay_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_LayerSolutionWithOverlay()
    }
}
