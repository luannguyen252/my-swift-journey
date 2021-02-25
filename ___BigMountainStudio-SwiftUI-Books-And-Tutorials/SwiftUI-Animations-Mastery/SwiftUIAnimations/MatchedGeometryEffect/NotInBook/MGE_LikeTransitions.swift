//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_LikeTransitions: View {
    @State private var showView2 = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Like Transitions")
            BannerText("The way matchedGeometryEffect works is like having opacity transitions on each view. MatchedGeometryEffect gives View 1 and View 2 an insert and removal opacity transition. Similar to this:", backColor: .green, textColor: .black)
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 2"))
                    .transition(AnyTransition.move(edge: .bottom)
                                    .combined(with: .opacity)
                                    .combined(with: .scale(scale: 0.3)))
                    .onTapGesture { showView2.toggle() }
            }
            
            if showView2 == false {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .overlay(Text("View 1"))
                    .transition(AnyTransition.move(edge: .top)
                                    .combined(with: .opacity)
                                    .combined(with: .scale(scale: 2)))
                    .frame(width: 100, height: 100)
                    .onTapGesture { showView2.toggle() }
            }
        }
        .animation(.default)
        .font(.title)
    }
}

struct MGE_LikeTransitions_Previews: PreviewProvider {
    static var previews: some View {
        MGE_LikeTransitions()
    }
}
