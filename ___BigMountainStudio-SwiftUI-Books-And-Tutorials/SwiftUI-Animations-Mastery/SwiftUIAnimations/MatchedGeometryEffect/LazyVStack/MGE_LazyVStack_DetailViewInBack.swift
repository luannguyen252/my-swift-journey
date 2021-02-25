//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_DetailViewInBack: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Layer Problem - Detail View Is In Back").multilineTextAlignment(.center)
                BannerText("Keep the parent view in the back with a negative zIndex.", backColor: .green, textColor: .black)
                
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
            //.zIndex(-1) // Keeps the parent view all the way in the back
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitDetailView(namespace: namespace,
                                   selectedFruit: $selectedFruit,
                                   fruitInfo: fruitInfo)
                    .zIndex(1) // Keeps detail view on top of the parent view
            }
        }
        .animation(.easeInOut)
    }
}

struct MGE_LazyVStack_DetailViewInBack_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_DetailViewInBack()
    }
}
