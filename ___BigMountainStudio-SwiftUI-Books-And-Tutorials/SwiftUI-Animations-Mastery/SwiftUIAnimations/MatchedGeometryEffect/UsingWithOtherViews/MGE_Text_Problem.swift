//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Text_Problem: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Text - Problem")
                BannerText("Using the matched geometry effect on text has its own challenges.", backColor: .green)
            
            Spacer()
            
            if showDetail {
                Text("More Details")
                    .font(Font.largeTitle)
                    .fontWeight(.heavy)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Spacer()
                Button("Close", action: { showDetail.toggle() })
            } else {
                Button(action: {
                    showDetail.toggle()
                }) {
                    Text("More Details")
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
            }
        }
        .font(.title)
        .animation(.easeInOut(duration: 0.7))
        .padding(.bottom)
    }
}

struct MGE_Text_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Text_Problem()
    }
}
