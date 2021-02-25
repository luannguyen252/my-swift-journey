//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Padding_NegativeSpacing: View {
    var body: some View {
        VStack(spacing: 8) {
            HeaderView("Padding",
                       subtitle: "Negative Spacing",
                       desc: "You can use negative spacing to adjust view positions too.",
                       back: Color("Theme4BackgroundColor"), textColor: Color("Theme4ForegroundColor"))
                .layoutPriority(1)
            
            Color.blue
                .frame(height: 50)
            Color.blue
                .frame(height: 50)
                .offset(y: -7) // Compare with offset
            Color.blue
                .frame(height: 50)
            Color.blue
                .frame(height: 50)
            Color.blue
                .frame(height: 50)
                .padding(.top, -7) // Makes your view taller
            Color.blue
                .frame(height: 50)
        }
        .font(.title)
    }
}

struct Padding_NegativeSpacing_Previews: PreviewProvider {
    static var previews: some View {
        Padding_NegativeSpacing()
    }
}
