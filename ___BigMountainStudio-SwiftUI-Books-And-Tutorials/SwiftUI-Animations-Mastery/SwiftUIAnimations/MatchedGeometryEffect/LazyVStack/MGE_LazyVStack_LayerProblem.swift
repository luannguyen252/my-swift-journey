//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_LayerProblem: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("LazyVStack - Layer Problem")
                BannerText("If you slow down the animation and look more closely you will notice when closing the view the image is behind everything else and getting clipped by the edge of the LazyVStack.", backColor: .green, textColor: .black)
                
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
            }
//            .zIndex(-1) // Another option instead of on the detail view
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitDetailView(namespace: namespace,
                                   selectedFruit: $selectedFruit,
                                   fruitInfo: fruitInfo)
                    .zIndex(2)
            }
        }
        .animation(.easeInOut(duration: 1))
    }
}

struct MGE_LazyVStack_LayerProblem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_LayerProblem()
    }
}
