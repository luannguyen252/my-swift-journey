//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_ClipShape: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("ClipShape")
            BannerText("Using the matched geometry effect to change the image's clip shape.", backColor: .green)
            
            Spacer()
            
            if showDetail == false {
                HStack {
                    Image("profile.female")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle()
                                    .strokeBorder(Color.green, lineWidth: 2))
                        .matchedGeometryEffect(id: "customerProfile", in: namespace)
                        .frame(height: 50)
                    
                    Text("Maria Santos")
                        .matchedGeometryEffect(id: "customerProfileText", in: namespace, properties: .position)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .onTapGesture {
                    showDetail.toggle()
                }
            }
            
            if showDetail {
                Text("Maria Santos")
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "customerProfileText", in: namespace, properties: .position)
                
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.green, lineWidth: 2))
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                
                Button("Close", action: { showDetail.toggle() })
            }
            
            Spacer()
        }
        .animation(.linear)
        .padding(.bottom)
    }
}

struct MGE_ClipShape_Previews: PreviewProvider {
    static var previews: some View {
        MGE_ClipShape()
    }
}
