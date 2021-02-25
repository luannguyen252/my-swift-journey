//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_HidingTheRow: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Hiding the Row")
                BannerText("There can be only one view that is the source. Use an if statement to hide the row.", backColor: .green, textColor: .black)
                
                List(items) { item in
                    if item.id != selectedFruit?.id {
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                                .frame(width: 75, height: 75)
                                .background(RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.green))
                            Text(item.name)
                                .font(.title)
                        }
                        .matchedGeometryEffect(id: item.id, in: namespace)
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
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitListDetailView(namespace: namespace, selectedFruit: $selectedFruit, fruitInfo: fruitInfo)
            }
        }
        .animation(.easeInOut(duration: 1))
    }
}

struct MGE_List_HidingTheRow_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_HidingTheRow()
    }
}
