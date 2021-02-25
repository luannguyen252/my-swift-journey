//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Images: View {
    @State private var zoom = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Images")
            BannerText("Using the matched geometry effect on images.", backColor: .green)
            
            Spacer()
            
            if zoom {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .onTapGesture { zoom.toggle() }
            } else {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .frame(height: 50)
                    .onTapGesture { zoom.toggle() }
            }
            
            Spacer()
        }
        .font(.title)
        .animation(.linear)
        .padding(.bottom)
    }
}

struct MGE_Images_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Images()
    }
}
