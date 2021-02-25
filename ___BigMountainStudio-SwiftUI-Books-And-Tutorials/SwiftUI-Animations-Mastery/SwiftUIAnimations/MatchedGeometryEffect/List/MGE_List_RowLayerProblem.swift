//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_RowLayerProblem: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    @State private var selectedFruitzIndexId = UUID()
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Row Layer Problem")
                BannerText("One idea is to try to make the zIndex of the selected row higher than the other rows. Didn't seem to work though.", backColor: .green, textColor: .black)
                
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
                            selectedFruitzIndexId = item.id
                            print(item.id)
                        }
                        .padding(.vertical)
                    } else {
                        Color.clear
                            .frame(height: 75)
                            .padding(.vertical)
                    }
                }
            }
            .zIndex(-1)
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitListDetailView5(namespace: namespace, selectedFruit: $selectedFruit, fruitInfo: fruitInfo)
            }
        }
        .animation(.easeInOut(duration: 2))
    }
}

struct MGE_List_RowLayerProblem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_RowLayerProblem()
    }
}
