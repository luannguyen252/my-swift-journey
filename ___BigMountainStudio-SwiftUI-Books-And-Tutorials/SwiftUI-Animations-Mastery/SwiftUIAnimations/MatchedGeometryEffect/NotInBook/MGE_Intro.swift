//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Intro: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Introduction")
            BannerText("The matchedGeometryEffect can be used on two views to synchronize their size and positions when hiding and showing.", backColor: .green, textColor: .black)
            
            VStack {
                if showView2 == false {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .overlay(Text("View 1"))
                        .matchedGeometryEffect(id: "change", in: namespace)
                }
            }
            .frame(height: 200)

            Button("Change") { showView2.toggle() }

            VStack {
                if showView2 {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.yellow)
                        .overlay(Text("View 2"))
                        .matchedGeometryEffect(id: "change", in: namespace)
                }
            }
            .frame(height: 200)
        }
        .animation(.default)
        .font(.title)
    }
}

struct MGE_Intro_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Intro()
    }
}
