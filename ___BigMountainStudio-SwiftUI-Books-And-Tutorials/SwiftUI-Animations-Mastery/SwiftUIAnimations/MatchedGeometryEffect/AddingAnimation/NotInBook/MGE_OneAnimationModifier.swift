//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_OneAnimationModifier: View {
    @Namespace var namespace
    @Namespace var namespace2
    @State private var isSource = true
    @State private var change = false
    @State private var change2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("One Animation Modifier")
            BannerText("When hiding and showing views, you may want to make all views source for better transitions.", backColor: .green, textColor: .black)
            
            HStack {
                VStack(spacing: 50) {
                    if change == false {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                            .animation(.easeIn(duration: 1))
                            .frame(width: 60, height: 60)
                            .onTapGesture { change = true }
                    } else {
                        Color.clear.frame(width: 60, height: 60)
                    }
                    
                    if change2 == false {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.orange)
                            .matchedGeometryEffect(id: "id2", in: namespace2, isSource: isSource)
                            .animation(.easeIn(duration: 1))
                            .frame(width: 60, height: 60)
                            .onTapGesture { change2 = true }
                    } else {
                        Color.clear.frame(width: 60, height: 60)
                    }
                }
                
                Spacer()
                if change || change2 {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                        .matchedGeometryEffect(id: "id2", in: namespace2, isSource: isSource)
                        .animation(.easeIn(duration: 0.35))
                        .frame(width: 160, height: 160)
                        .onTapGesture {
                            change = false
                            change2 = false
                        }
                } else {
                    Color.clear.frame(width: 160, height: 160)
                }
            }
        }
        .font(.title)
        //        .animation(.easeIn(duration: 1))
    }
}

struct MGE_OneAnimationModifier_Previews: PreviewProvider {
    static var previews: some View {
        MGE_OneAnimationModifier()
    }
}
