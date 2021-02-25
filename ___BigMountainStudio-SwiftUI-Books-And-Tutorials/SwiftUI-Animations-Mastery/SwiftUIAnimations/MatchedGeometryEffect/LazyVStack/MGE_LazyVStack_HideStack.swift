//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_HideStack: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            if selectedFruit == nil {
                FruitLazyVStackView(namespace: namespace,
                                    fruits: items,
                                    selectedFruit: $selectedFruit)
            } else {
                if let fruitInfo = selectedFruit {
                    MGEFruitDetailView(namespace: namespace,
                                       selectedFruit: $selectedFruit,
                                       fruitInfo: fruitInfo)
                }
            }
        }
        .animation(.default)
    }
}

struct FruitLazyVStackView: View {
    var namespace: Namespace.ID
    var fruits: [Item]!
    @Binding var selectedFruit: Item!
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Hiding the LazyVStack")
            BannerText("Hiding the LazyVStack is another option that will make the layering problem less obvious.", backColor: .green, textColor: .black)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(fruits) { item in
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: item.id, in: namespace)
                                .frame(width: 50, height: 36)
                                .zIndex(1)
                            
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
        }
    }
}

struct MGE_LazyVStack_HideStack_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_HideStack()
    }
}
