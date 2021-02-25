//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_WhatCouldGoWrong_ClipShapeSolution: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("ClipShape Solution")
            BannerText("You want the clipShape modifier to resize and reposition with the view. So you have to put it ABOVE the matched geometry effect modifier.", backColor: .green, textColor: .black)
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 2"))
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture { showView2.toggle() }
            } else {
                Rectangle()
                    .fill(Color.blue)
                    .overlay(Text("View 1"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .offset(x: -130)
                    .frame(width: 100, height: 100)
                    .onTapGesture { showView2.toggle() }
            }
        }
        .animation(.easeOut(duration: 0.5))
        .font(.title)
    }
}

struct MGE_WhatCouldGoWrong_ClipShapeSolution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_WhatCouldGoWrong_ClipShapeSolution()
    }
}
