//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_ShowingDescriptionAndButton: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Showing Description & Button")
                    .multilineTextAlignment(.center)
                BannerText("Add a delayed animation to show the description and button.", backColor: .green, textColor: .black)
                
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
            
            // Detail View
            if let fruitInfo = selectedFruit {
                MGEFruitListDetailView5(namespace: namespace, selectedFruit: $selectedFruit, fruitInfo: fruitInfo)
            }
        }
        .animation(.easeInOut(duration: 2))
    }
}

struct MGEFruitListDetailView5: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    @State private var show = false
    
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
            
            Group {
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
            .opacity(show ? 1 : 0)
            // .animation(Animation.easeOut.delay(0.35))
        }
        .font(.title)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .shadow(radius: 10)
                        .matchedGeometryEffect(id: "\(fruitInfo.id)background", in: namespace)
        )
        // Alternative to delaying showing the text and button
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                withAnimation(Animation.easeOut.delay(0.35)) {
                    show.toggle()
                }
            }
        }
    }
}

struct MGE_List_ShowingDescriptionAndButton_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_ShowingDescriptionAndButton()
    }
}
