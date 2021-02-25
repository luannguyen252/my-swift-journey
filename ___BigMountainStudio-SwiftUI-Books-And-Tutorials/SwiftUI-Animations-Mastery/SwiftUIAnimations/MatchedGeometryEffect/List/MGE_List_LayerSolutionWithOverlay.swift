//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_LayerSolutionWithOverlay: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("List - Layer Solution with Overlay")
            BannerText("Use an overlay modifier to show your detail view on top of another view.", backColor: .green, textColor: .black)
            
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
                } else {
                    Color.clear
                        .frame(height: 75)
                        .padding(.vertical)
                }
            }
        }
        .overlay(
            Group {
                // Detail View
                if let fruitInfo = selectedFruit {
                    MGEFruitListDetailView5(namespace: namespace, selectedFruit: $selectedFruit,
                                            fruitInfo: fruitInfo)
                }
            }
        )
        .animation(.easeInOut)
    }
}

struct MGE_List_LayerSolutionWithOverlay_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item? = Item(name: "Blackberries",
                                                  imageName: "Blackberries")
    
    static var previews: some View {
        Group {
            MGE_List_LayerSolutionWithOverlay()
            
            MGEFruitListDetailView5(namespace: ns, selectedFruit: $selectedFruit,
                                    fruitInfo: selectedFruit!)
        }
    }
}
