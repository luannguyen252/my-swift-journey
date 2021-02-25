//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

import AVKit

struct VideoPlayer_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VideoPlayer",
                       subtitle: "Introduction",
                       desc: "You can now play videos with a SwiftUI VideoPlayer view.",
                       back: .orange)
            
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "bms", withExtension: "mov")!))
            
            DescView(desc: "This is an example of playing a local video file called 'bms.mov'.", back: .orange)
        }
        .font(.title)
    }
}

struct VideoPlayer_Intro_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer_Intro()
    }
}
