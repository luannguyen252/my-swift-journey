//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Group_MultipleVStacks: View {
    var body: some View {
        GeometryReader { gp in
            Text("GeometryReader - Is acting like a ZStack")
            Group {
                VStack {
                    Text("VStack 1")
                }
                VStack {
                    Text("VStack 2")
                }
            }
        }
    }
}

struct Group_MultipleVStacks_Previews: PreviewProvider {
    static var previews: some View {
        Group_MultipleVStacks()
    }
}
