//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_InstantlyClosingDetail: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Instantly Closing")
                    .multilineTextAlignment(.center)
                BannerText("Use two animation modifiers. Have no animation duration on the animation that closes the detail view so it's instant.", backColor: .green, textColor: .black)
                
                List(items) { item in
                    if item.id != selectedFruit?.id {
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                                .matchedGeometryEffect(id: "\(item.id)image", in: namespace)
                                .frame(width: 75, height: 75)
                                .background(RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.green)
                                                .matchedGeometryEffect(id: "\(item.id)background", in: namespace))
                            
                            Text(item.name)
                                .font(.title)
                                .matchedGeometryEffect(id: "\(item.id)title", in: namespace)
                        }
                        .onTapGesture {
                            selectedFruit = item
                        }
                        .padding(.vertical)
                        .animation(.none) // Closing Animation
                    } else {
                        Color.clear
                            .frame(height: 75)
                            .padding(.vertical)
                    }
                }
            }
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitListDetailView5(namespace: namespace, selectedFruit: $selectedFruit, fruitInfo: fruitInfo)
                    .animation(.easeInOut) // Opening Animation
            }
        }
    }
}

struct MGE_List_InstantlyClosingDetail_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_InstantlyClosingDetail()
    }
}
