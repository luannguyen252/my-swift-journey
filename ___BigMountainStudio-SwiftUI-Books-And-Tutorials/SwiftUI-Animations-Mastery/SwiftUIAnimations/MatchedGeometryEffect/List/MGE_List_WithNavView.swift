//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_WithNavView: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    SubtitleText("List - In Nav View")
                    BannerText("Test to see if we can transition with matched geometry effect and NavigationLink.", backColor: .green, textColor: .black)
                }
                
                Section {
                    ForEach(items) { item in
                        NavigationLink(destination: MGEFruitListDetailView7(namespace: namespace,fruitInfo: item)) {
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
                        }
                    }
                }
            }
            .navigationTitle("MatchedGeometryEffect")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct MGEFruitListDetailView7: View {
    var namespace: Namespace.ID
    var fruitInfo: Item
    
    var body: some View {
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
                .matchedGeometryEffect(id: "\(fruitInfo.id)image", in: namespace)
            Spacer()
            
            Text("Details about the \(fruitInfo.name).")
        }
        .font(.title)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .shadow(radius: 10)
                        .matchedGeometryEffect(id: "\(fruitInfo.id)background", in: namespace))
        .navigationTitle("Details")
    }
}

struct MGE_List_WithNavView_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_WithNavView()
    }
}
