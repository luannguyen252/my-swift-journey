//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_DisableBackground: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    @State private var isDisabled = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("LazyVStack - Disable Background")
            BannerText("Combine the disabled modifier with the blur modifier to prevent users from tapping other views behind the detail view.", backColor: .green, textColor: .black)
            
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
            //            .blur(radius: selectedFruit != nil ? 3 : 0)
            .disabled(isDisabled)
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
        //        .animation(.easeInOut(duration: 1))
        //        .animation(.spring(dampingFraction: 0.5))
    }
}

struct MGE_LazyVStack_DisableBackground_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_DisableBackground()
    }
}
