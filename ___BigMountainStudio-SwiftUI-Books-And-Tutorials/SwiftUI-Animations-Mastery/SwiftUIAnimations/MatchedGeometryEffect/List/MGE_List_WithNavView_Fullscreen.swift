//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_WithNavView_Fullscreen: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    SubtitleText("NavigationView - Full Screen")
                    BannerText("Instead of navigating to a new view, try showing the new view fullscreen instead.", backColor: .green, textColor: .black)
                }
                
                ForEach(items) { fruit in
                    HStack {
                        if selectedFruit == nil {
                            Image(fruit.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                                .matchedGeometryEffect(id: fruit.id, in: namespace)
                                .frame(width: 75, height: 75)
                                .background(RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.green)
                                                .matchedGeometryEffect(id: "\(fruit.id)background", in: namespace))
                            
                            Text(fruit.name)
                                .font(.title)
                                .matchedGeometryEffect(id: "\(fruit.id)title", in: namespace)
                        } else {
                            Color.clear
                                .frame(height: 75)
                        }
                    }
                    .onTapGesture {
                        selectedFruit = fruit
                    }
                }
            }
            .navigationTitle("MatchedGeometryEffect")
            .navigationBarTitleDisplayMode(.inline)
        }
        .overlay(
            Group {
                // Detail View
                if let fruitInfo = selectedFruit {
                    MGEFruitListDetailView8(namespace: namespace,
                                            selectedFruit: $selectedFruit,
                                            fruitInfo: fruitInfo)
                }
            }
        )
        .animation(.easeIn(duration: 0.35))
    }
}

struct MGEFruitListDetailView8: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .matchedGeometryEffect(id: "\(fruitInfo.id)background", in: namespace)
            
            VStack(spacing: 20.0) {
                Text("\(fruitInfo.name)")
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "\(fruitInfo.id)title", in: namespace, properties: .position)
                Spacer()
                Image(fruitInfo.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 5)
                    .padding(40)
                    .matchedGeometryEffect(id: fruitInfo.id, in: namespace)
                Spacer()
                
                Text("Details about the \(fruitInfo.name).")
            }
            .font(.title)
        }
        .onTapGesture {
            selectedFruit = nil
        }
    }
}

struct MGE_List_WithNavView_Fullscreen_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item! = Item(name: "Blackberries", imageName: "Blackberries")
    
    static var previews: some View {
        Group {
            MGE_List_WithNavView_Fullscreen()
            
            MGEFruitListDetailView8(namespace: ns,
                                    selectedFruit: $selectedFruit,
                                    fruitInfo: selectedFruit)
        }
    }
}
