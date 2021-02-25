//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_MatchingJustSize: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Matching Just Size")
            BannerText("By default the matched geometry effect will match size and position. But you can specify to only match the size of the source view.", backColor: .green, textColor: .black)

            Text("The blue shapes are matching the size of the green shape:")
            
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "id", in: namespace)
                    .border(Color.red)

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .matchedGeometryEffect(id: "id", in: namespace,
                                           properties: .size, isSource: false)
                    .border(Color.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .matchedGeometryEffect(id: "id", in: namespace,
                                           properties: .size, isSource: false)
                    .border(Color.red)
            }
        }
        .font(.title)
    }
}

struct MGE_MatchingJustSize_Previews: PreviewProvider {
    static var previews: some View {
        MGE_MatchingJustSize()
    }
}
