//  Created by Mark Moeykens on 6/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.

import SwiftUI

struct VStack_Intro : View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("VStack",
                       subtitle: "Introduction",
                       desc: "A VStack will vertically arrange other views within it.",
                       back: .blue, textColor: .white)
            
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
        }
        .font(.title)
    }
}

struct VStack_Intro_Previews : PreviewProvider {
    static var previews: some View {
        VStack_Intro()
    }
}
