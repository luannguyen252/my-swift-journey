//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_MatchingJustPosition: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 40) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Matching Just Position")
            BannerText("When you match just the position property, all the views will stack on each other.", backColor: .green, textColor: .black)

            Text("The blue shape is the source:")
            
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 140, height: 140)
                    .matchedGeometryEffect(id: "id", in: namespace,
                                           properties: .position, isSource: false)
                    .border(Color.red)

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "id", in: namespace)
                    .border(Color.red)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
                    .matchedGeometryEffect(id: "id", in: namespace,
                                           properties: .position, isSource: false)
                    .border(Color.red)
            }
        }
        .font(.title)
    }
}

struct MGE_MatchingJustPosition_Previews: PreviewProvider {
    static var previews: some View {
        MGE_MatchingJustPosition()
    }
}
