//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Link_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Link",
                       subtitle: "Introduction",
                       desc: "Use a Link to open the default web browser and navigate to a URL.")
            
            Link("Go to Apple", destination: URL(string: "https://www.apple.com")!)
            
            Spacer()
        }
        .font(.title)
    }
}

struct Link_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Link_Intro()
    }
}
