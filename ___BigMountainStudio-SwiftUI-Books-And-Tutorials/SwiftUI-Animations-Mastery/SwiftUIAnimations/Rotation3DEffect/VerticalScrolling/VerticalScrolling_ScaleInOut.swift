//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct VerticalScrolling_ScaleInOut: View {
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Vertical Scrolling")
            SubtitleText("Scale In Out")
            BannerText("You can have your content scale up into view and then scale out.")
            
            let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
            
            GeometryReader { fullView in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<50) { index in
                            GeometryReader { cardGP in
                                Rectangle()
                                    .fill(colors[index % 7])
                                    .rotation3DEffect(
                                        .degrees(-Double(cardGP.frame(in: .global).minY - fullView.size.height / 2) / 10),
                                        axis: (x: 1, y: 0, z: 0))
                                    .overlay(
                                        VStack {
                                            Text("\(cardGP.frame(in: .global).minY)")
                                            Text("\(fullView.size.height / 2)")
                                        }
                                    )
                            }
                            .frame(height: 150)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct VerticalScrolling_ScaleInOut_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrolling_ScaleInOut()
    }
}
