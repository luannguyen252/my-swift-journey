//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_GridToDetail: View {
    @State private var fruits = Data.getFruits()
    @State private var selectedFruit: Item?
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Working With Grids")
                BannerText("Using the matched geometry effect to transition one view to a detail view.", backColor: .green, textColor: .black)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(fruits) { fruit in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15).fill(Color.green)
                                
                                if fruit.id != selectedFruit?.id {
                                    Button(action: {
                                        selectedFruit = fruit
                                    }) {
                                        Image(fruit.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                    }
                                    .matchedGeometryEffect(id: fruit.id, in: namespace)
                                }
                            }
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
            
            if let fruit = selectedFruit {
                MGE_GridDetailView(namespace: namespace, selectedFruit:
                                    $selectedFruit, fruitInfo: fruit)
            }
        }
        .animation(.spring(dampingFraction: 0.7))
    }
}

struct MGE_GridDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    
    var body: some View {
        VStack {
            Text("\(fruitInfo.name)").font(.largeTitle)
            
            Image(fruitInfo.imageName).resizable()
                .scaledToFit().padding()
                .matchedGeometryEffect(id: fruitInfo.id, in: namespace)
            
            Button(action: {
                selectedFruit = nil
            }, label: {
                Text("Close").padding()
                    .background(Capsule().fill(Color.white))
            })
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green).shadow(radius: 20)
        )
        .padding(20)
    }
}

struct MGE_GridToDetail_Previews: PreviewProvider {
    static var previews: some View {
        MGE_GridToDetail()
    }
}
