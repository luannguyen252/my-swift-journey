//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MatchedGeometryEffect_Intro: View {
    var body: some View {
        VStack {
            Text("https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.hackingwithswift.com%2Fquick-start%2Fswiftui%2Fhow-to-synchronize-animations-from-one-view-to-another-with-matchedgeometryeffect&event=video_description&redir_token=sFPjDS4WQWkuVRRfQopBpmPjPqV8MTU5MzE4ODAyNEAxNTkzMTAxNjI0&v=-h8pk2pe7Xo")
            Text("https://youtu.be/kF4yFSiOee0")
            Text("MGE affects position and size. So don't hardcode these")
            Text("No text size changes")
            
        }
    }
}

struct MatchedGeometryEffect_Intro_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect_Intro()
    }
}
