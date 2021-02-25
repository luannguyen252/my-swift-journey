//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_WithForEach: View {
    var body: some View {
        List {
            ForEach(0 ..< 50) { item in
                Text("Item: \(item)")
            }
        }
    }
}

struct List_WithForEach_Previews: PreviewProvider {
    static var previews: some View {
        List_WithForEach()
    }
}
