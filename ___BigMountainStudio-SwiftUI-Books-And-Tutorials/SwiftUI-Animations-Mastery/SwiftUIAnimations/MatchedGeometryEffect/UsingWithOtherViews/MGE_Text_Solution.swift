//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Text_Solution: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Text - Solution")
                BannerText("When it comes to text, don't worry about matching the size. Just match the position and it will look a lot better.", backColor: .green)
            
            Spacer()
            
            if showDetail {
                Text("More Details")
                    .font(Font.largeTitle)
                    .fontWeight(.heavy)
                    .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                Spacer()
                Button("Close", action: { showDetail.toggle() })
            } else {
                Button(action: {
                    showDetail.toggle()
                }) {
                    Text("More Details")
                        .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                }
            }
        }
        .font(.title)
        .animation(.easeInOut(duration: 0.7))
        .padding(.bottom)
    }
}

struct MGE_Text_Solution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Text_Solution()
    }
}
