//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_HStack_Intro: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let fruits = Data.getFruits()
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("HStack")
            BannerText("Although the HStack will clip its child views, you can minimize the effect by speeding up the animation.", backColor: .green, textColor: .black)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(fruits) { fruit in
                        FruitColumnView(namespace: namespace,
                                        selectedFruit: $selectedFruit,
                                        fruit: fruit)
                    }
                }
            }
            .frame(height: 200)
            Spacer()
            BannerText("The clipping becomes barely noticeable anymore.", backColor: .green, textColor: .black)
        }
        .overlay( Group {
            if let fruitInfo = selectedFruit {
                MGEFruitDetailFullView(namespace: namespace,
                                       selectedFruit: $selectedFruit,
                                       fruit: fruitInfo,
                                       delayTime: 0.5)
            }
        })
        .animation(.easeInOut(duration: 0.25)) // 0.35 is the default
    }
}

struct FruitColumnView: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruit: Item
    
    var body: some View {
        ZStack {
            if fruit.id != selectedFruit?.id {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .matchedGeometryEffect(id: fruit.id, in: namespace)
                
                VStack {
                    Spacer(minLength: 0)
                    Image(fruit.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: fruit.imageName, in: namespace)
                        .padding()
                    Spacer()
                    Text(fruit.name)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: fruit.name+"title",
                                               in: namespace, properties: .position)
                }
                .padding()
            }
        }
        .frame(width: 150)
        .onTapGesture { selectedFruit = fruit }
    }
}

struct MGE_HStack_Intro_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedFruit: Item? = Item(name: "Blackberries",
                                                  imageName: "Blackberries")
    @State static var fruit: Item = Item(name: "Cherry", imageName: "Cherry")
    
    static var previews: some View {
        Group {
            MGE_HStack_Intro()
            
            FruitColumnView(namespace: ns, selectedFruit: $selectedFruit, fruit: fruit)
                .previewLayout(.sizeThatFits)
                .frame(height: 200)
            
            MGEFruitDetailFullView(namespace: ns,
                                   selectedFruit: $selectedFruit,
                                   fruit: selectedFruit!)
        }
    }
}
