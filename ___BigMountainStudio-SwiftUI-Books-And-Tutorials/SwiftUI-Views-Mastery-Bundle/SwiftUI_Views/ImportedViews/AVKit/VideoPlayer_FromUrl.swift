//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

import AVKit

struct VideoPlayer_FromUrl: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VideoPlayer",
                       subtitle: "From URL",
                       desc: "You can also play videos from the Web using a URL.",
                       back: .orange)
            

            VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.myvideohosting.com/1234")!))

            
            DescView(desc: "Note: The movie should be a file hosted on the Web. You won't be able to publicly hosted videos from YouTube, for example.", back: .orange)
        }
        .font(.title)
    }
}

struct VideoPlayer_FromUrl_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer_FromUrl()
    }
}
