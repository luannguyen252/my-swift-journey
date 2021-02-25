//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

import AVKit

struct VideoPlayer_Overlay: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VideoPlayer",
                       subtitle: "Overlay",
                       desc: "You can overlay any view you want on the VideoPlayer using the second parameter of the initializer.",
                       back: .orange)
            
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "bms", withExtension: "mov")!)) {
                VStack {
                    Image("bms")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .opacity(0.5)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
        .font(.title)
    }
}

struct VideoPlayer_Overlay_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer_Overlay()
    }
}
