//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_TogglingIsSource: View {
    @Namespace var namespace
    @State var isSource = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Toggling isSource")
            BannerText("You can also toggle the isSource property with a @State property.", backColor: .green, textColor: .black)
            
            Text("\(isSource ? "Yellow" : "Blue") is now 'source'")
            
            HStack {
                Text("Yellow").frame(maxWidth: .infinity)
                Text("Blue").frame(maxWidth: .infinity)
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource == false)
            }
            
            Button("Toggle isSource", action: { isSource.toggle() })
                .padding(.bottom)
        }
        .font(.title)
    }
}

struct MGE_TogglingIsSource_Previews: PreviewProvider {
    static var previews: some View {
        MGE_TogglingIsSource()
    }
}
