//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_WithProblems: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Using Lists - With Problems")
                BannerText("We're going to use this example of using a List to identify and fix many problems when using the matched geometry effect.", backColor: .green, textColor: .black)
                
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
                    .matchedGeometryEffect(id: item.id, in: namespace)
                    .onTapGesture {
                        selectedFruit = item
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

struct MGEFruitListDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("\(fruitInfo.name)").font(.largeTitle)
            Spacer()
            Image(fruitInfo.imageName).resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
                .padding(40)
            Spacer()
            Text("Details about the \(fruitInfo.name).")
            Button(action: { selectedFruit = nil }) {
                Text("Close")
                    .foregroundColor(.green)
                    .padding()
                    .background(Capsule()
                                    .fill(Color.white))
            }
        }
        .font(.title).padding()
        .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .shadow(radius: 10))
        .matchedGeometryEffect(id: fruitInfo.id, in: namespace)
    }
}

struct MGE_List_WithProblems_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_WithProblems()
    }
}
