//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Positioning_Problem: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Positioning - Problem")
            BannerText("Putting positioning modifiers before matchedGeometryEffect will change the view before the transition begins:", backColor: .green)
            
            VStack {
                if showView2 == false {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green)
                        .overlay(Text("View 1"))
                        .matchedGeometryEffect(id: "change", in: namespace)
                }
            }
            .frame(height: 200)
            
            Button("Change") {
                showView2.toggle()
            }
            
            VStack {
                if showView2 {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.yellow)
                        .overlay(Text("View 2"))
                        .offset(x: 100) // Positioning altering modifier
                        .matchedGeometryEffect(id: "change", in: namespace)
                        .frame(width: 200, height: 200)
                }
            }
            .frame(height: 200)
        }
        .animation(.default)
        .font(.title)
    }
}

struct MGE_Positioning_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Positioning_Problem()
    }
}
