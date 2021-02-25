//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_OneSource: View {
    @Namespace var namespace
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("When One View is Source")
            BannerText("You can set one view as source. The animation will look good when the source gets hidden. Not so good when shown.", backColor: .green, textColor: .black)
            Text("Blue is the source")
            HStack {
                if change == false {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "id", in: namespace)
                        .frame(width: 60, height: 60)
                        .onTapGesture { change.toggle() }
                }
                Spacer()
                if change {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: false)
                        .frame(width: 160, height: 160)
                        .onTapGesture { change.toggle() }
                }
            }
            .frame(height: 160)
        }
        .animation(.easeIn)
        .font(.title)
    }
}

struct MGE_OneSource_Previews: PreviewProvider {
    static var previews: some View {
        MGE_OneSource()
    }
}
