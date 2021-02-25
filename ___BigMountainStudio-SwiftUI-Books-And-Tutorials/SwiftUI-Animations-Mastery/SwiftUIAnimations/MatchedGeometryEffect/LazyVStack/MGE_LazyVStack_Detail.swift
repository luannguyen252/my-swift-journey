//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_Detail: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Using LazyVStack")
                BannerText("I will take you through steps for one way you can create a LazyVStack and tap on the views to get more detail.", backColor: .green, textColor: .black)
                
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
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitDetailView(namespace: namespace,
                                   selectedFruit: $selectedFruit,
                                   fruitInfo: fruitInfo)
            }
        }
        .animation(.default)
    }
}

struct MGEFruitDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("\(fruitInfo.name)")
                .font(.largeTitle)
            Spacer()
            Image(fruitInfo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: fruitInfo.id, in: namespace)
                .shadow(radius: 5)
                .padding(40)
            Spacer()
            Text("Details about the \(fruitInfo.name).")
            Button(action: {
                selectedFruit = nil
            }) {
                Text("Close")
                    .foregroundColor(.green)
                    .padding()
                    .background(Capsule().fill(Color.white))
            }
        }
        .font(.title)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .shadow(radius: 10))
    }
}

struct MGE_LazyVStack_Detail_Previews: PreviewProvider {
    @Namespace static var namespace
    @State static var selectedFruit: Item? = Item(name: "Coconut", imageName: "Coconut")
    
    static var previews: some View {
        Group {
            MGE_LazyVStack_Detail()
                .preferredColorScheme(.dark)
            
            MGEFruitDetailView(namespace: namespace,
                               selectedFruit: $selectedFruit,
                               fruitInfo: selectedFruit!)
                .preferredColorScheme(.dark)
        }
    }
}
