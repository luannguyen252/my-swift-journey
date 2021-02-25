//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_List_DisableRowsUntilAnimationEnds: View {
    @Namespace var namespace
    @State private var selectedFruit: Item?
    @State private var isRowDisabled = false
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("List - Disable Rows Until Animation is Done").multilineTextAlignment(.center)
                BannerText("Don't allow users to tap rows until the detail view closing animation is complete.", backColor: .green, textColor: .black)
                
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
                            isRowDisabled = true
                        }
                        .padding(.vertical)
                        .disabled(isRowDisabled)
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
                MGEFruitListDetailView6(namespace: namespace,
                                        selectedFruit: $selectedFruit,
                                        fruitInfo: fruitInfo,
                                        isRowDisabled: $isRowDisabled)
            }
        }
        .animation(.easeInOut(duration: 0.35))
    }
}

struct MGEFruitListDetailView6: View {
    var namespace: Namespace.ID
    @Binding var selectedFruit: Item!
    var fruitInfo: Item
    @Binding var isRowDisabled: Bool
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
                    
                    // Try to make the delay the same as your closing animation + 0.2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        isRowDisabled = false
                    }
                }) {
                    Text("Close")
                        .foregroundColor(.green)
                        .padding()
                        .background(Capsule().fill(Color.white))
                }
            }
            .opacity(show ? 1 : 0)
            .animation(Animation.easeOut.delay(0.35))
        }
        .font(.title)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .shadow(radius: 10)
                        .matchedGeometryEffect(id: "\(fruitInfo.id)background", in: namespace)
        )
        .onAppear {
            show.toggle()
        }
    }
}

struct MGE_List_DisableRowsUntilAnimationEnds_Previews: PreviewProvider {
    static var previews: some View {
        MGE_List_DisableRowsUntilAnimationEnds()
    }
}
