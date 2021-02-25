//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_HidingShowingViews: View {
    @Namespace var namespace
    @State private var showCircle = true
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Hiding & Showing Views    ")
            BannerText("When you match just the position property, all the views will stack on each other.", backColor: .green, textColor: .black)
            
            Text("The blue shape is the source:")
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .matchedGeometryEffect(id: "id", in: namespace)
            
            if showCircle {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "id", in: namespace,
                                       properties: .position, isSource: false)
            }
            Spacer()
            Toggle("Show Red Circle", isOn: $showCircle)
                .padding(.horizontal)
        }
//        .animation(.easeIn)
        .font(.title)
    }
}

struct MGE_HidingShowingViews_Previews: PreviewProvider {
    static var previews: some View {
        MGE_HidingShowingViews()
    }
}
