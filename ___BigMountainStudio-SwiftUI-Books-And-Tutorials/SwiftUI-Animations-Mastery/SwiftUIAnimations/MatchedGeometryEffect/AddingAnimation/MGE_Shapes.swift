//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Shapes: View {
    @State private var changeView = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Shapes")
            BannerText("Shapes are great candidates for the matchedGeometryEffect. You can smoothly transition from one shape to another without much problem.", backColor: .green, textColor: .black)
            Spacer()
            
            if changeView {
                Rectangle()
                    .fill(Color.green)
                    .overlay(Text("View 2"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture { changeView.toggle() }
            } else {
                Circle()
                    .fill(Color.green)
                    .overlay(Text("View 1"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture { changeView.toggle() }
            }
        }
        .animation(.default)
        .font(.title)
    }
}

struct MGE_Shapes_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Shapes()
    }
}
