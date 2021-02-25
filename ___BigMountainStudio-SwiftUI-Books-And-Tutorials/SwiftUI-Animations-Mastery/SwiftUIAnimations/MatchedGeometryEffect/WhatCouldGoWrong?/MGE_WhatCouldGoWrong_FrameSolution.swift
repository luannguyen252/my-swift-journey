//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_WhatCouldGoWrong_FrameSolution: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Frame Solution")
            BannerText("The destination frame should be BELOW the matched geometry effect.", backColor: .green, textColor: .black)
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 2"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture { showView2.toggle() }
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 1"))
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture { showView2.toggle() }
            }
        }
        .animation(.default)
        .font(.title)
    }
}

struct MGE_WhatCouldGoWrong_FrameSolution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_WhatCouldGoWrong_FrameSolution()
    }
}
