//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HorizontalScrolling_YAxis2: View {
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Vertical Scrolling")
            SubtitleText("Scale In Out")
            BannerText("You can have your content scale up into view and then scale out.")
            
            let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
            
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            GeometryReader { geo in
                                Rectangle()
                                    .fill(colors[index % 7])
                                    .frame(height: 150)
                                    .rotation3DEffect(
                                        .degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10),
                                        axis: (x: 0, y: 1, z: 0))
                            }
                            .frame(width: 150)
                            .padding(.vertical)
                        }
                    }
                }
                .frame(height: 200)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HorizontalScrolling_YAxis2_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrolling_YAxis2()
    }
}
