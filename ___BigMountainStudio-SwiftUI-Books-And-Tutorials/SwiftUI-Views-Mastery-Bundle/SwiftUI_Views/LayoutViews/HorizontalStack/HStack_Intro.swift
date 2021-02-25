//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HStack_Intro: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("HStack",
                       subtitle: "Introduction",
                       desc: "An HStack will horizontally arrange other views within it.",
                       back: .orange)
            
            HStack {
                Text("View 1")
                Text("View 2")
                Text("View 3")
            }
        }
        .font(.title)
    }
}

struct HStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        HStack_Intro()
    }
}
