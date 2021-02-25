//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Source_DifferentIds: View {
    @Namespace var namespace
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("2 Sources - Different IDs")
            BannerText("You CAN have two sources inside the same namespace as long as they have different IDs.", backColor: .green, textColor: .black)
            HStack {
                if change == false {
                    RoundedRectangle(cornerRadius: 16).fill(Color.blue)
                        .matchedGeometryEffect(id: "id", in: namespace)
                        .frame(width: 60, height: 60)
                        .onTapGesture { change.toggle() }
                } else {
                    RoundedRectangle(cornerRadius: 16).fill(Color.green)
                        .matchedGeometryEffect(id: "id", in: namespace)
                        .onTapGesture { change.toggle() }
                }
            }
//            HStack {
//                if change {
//                    RoundedRectangle(cornerRadius: 16).fill(Color.red)
//                        .matchedGeometryEffect(id: "id2", in: namespace)
//                        .frame(width: 60, height: 60)
//                } else {
//                    RoundedRectangle(cornerRadius: 16).fill(Color.orange)
//                        .matchedGeometryEffect(id: "id2", in: namespace)
//                }
//            }
        }
        .animation(.spring(dampingFraction: 0.7))
        .font(.title)
    }
}

struct MGE_Source_DifferentIds_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Source_DifferentIds()
    }
}
