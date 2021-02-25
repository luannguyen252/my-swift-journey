//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_MatchingGeometries: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Matching Geometries")
            BannerText("The matchedGeometryEffect will give two views the same size and position.", backColor: .green, textColor: .black)
            
            Text("Normal")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow.opacity(0.4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.4))
            }
            Text("Matched Geometries")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace)
            }
        }
        .font(.title)
    }
}

struct MGE_MatchingGeometries_Previews: PreviewProvider {
    static var previews: some View {
        MGE_MatchingGeometries()
    }
}
