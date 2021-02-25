//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Images_Problem: View {
    @State private var zoom = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Images - Problem")
            BannerText("Adding a border to the image doesn't work like you might expect. What is the problem here?", backColor: .green)
            
            Spacer()
            
            if zoom {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .border(Color.green, width: 2)
                    .onTapGesture { zoom.toggle() }
            } else {
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .border(Color.green, width: 2)
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

struct MGE_Images_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Images_Problem()
    }
}
