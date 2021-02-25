//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LazyVStack_Same_Id: View {
    @Namespace var namespace
    @State private var selectedFruit: Item!
    
    let items = Data.getFruits()
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Using Same Ids")
                BannerText("Every single view needs to have its own unique matched geometry effect id. This is what will happen if not.", backColor: .green, textColor: .black)
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(items) { item in
                            HStack {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: "fruit", in: namespace)
                                    .frame(width: 50, height: 36)
                                
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
        }
        .animation(.default)
    }
}

struct MGE_LazyVStack_Same_Id_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LazyVStack_Same_Id()
    }
}
