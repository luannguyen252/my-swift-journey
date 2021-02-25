//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_SettingTheSource: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Setting the Source")
            BannerText("Why didn't the blue shape move to the yellow shape? If both views are different sizes, which size is used? The view that is the 'source' is used for matching.", backColor: .green, textColor: .black)
            

            Text("Yellow is now 'source'")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: true)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: false)
            }
        }
        .font(.title)
    }
}

struct MGE_SettingTheSource_Previews: PreviewProvider {
    static var previews: some View {
        MGE_SettingTheSource()
    }
}
