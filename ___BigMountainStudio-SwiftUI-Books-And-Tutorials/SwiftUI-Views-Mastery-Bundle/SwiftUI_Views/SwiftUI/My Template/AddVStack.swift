//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AddVStack: View {
    var body: some View {
        // Only one view can be returned from the body property.
        // Add 20 points between views within this container.
        VStack(spacing: 20) { // VStack is a container view that can hold up to 10 views
            Text("Title")
                .font(.largeTitle)
        }
    }
}

struct AddVStack_Previews: PreviewProvider {
    static var previews: some View {
        AddVStack()
    }
}
