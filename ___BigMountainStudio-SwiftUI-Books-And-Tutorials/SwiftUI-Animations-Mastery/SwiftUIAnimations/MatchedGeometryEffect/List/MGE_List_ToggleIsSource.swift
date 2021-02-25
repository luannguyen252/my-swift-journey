//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_ToggleIsSource: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Toggle isSource")
                BannerText("As an alternative, you can also toggle the isSource parameter.", backColor: .green, textColor: .black)
                
                List(items) { item in
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
                    .matchedGeometryEffect(id: item.id, in: namespace, isSource: showDetail)
                    .onTapGesture {
                        selectedFruit = item
                        showDetail.toggle()
                    }
                    .padding(.vertical)
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

struct MGE_List_ToggleIsSource_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_ToggleIsSource()
    }
}
