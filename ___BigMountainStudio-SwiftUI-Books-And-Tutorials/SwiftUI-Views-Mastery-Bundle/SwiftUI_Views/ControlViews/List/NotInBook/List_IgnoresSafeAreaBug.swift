//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_IgnoresSafeAreaBug: View {
    var body: some View {
        List {
            Section(header: Color.blue, footer: Text("7 People on Staff")) {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                Text("The blue bar on top should be UNDER the notch.")
            }
        }
        .ignoresSafeArea(edges: .top)
        .font(.title)
    }
}

struct List_IgnoresSafeAreaBug_Previews: PreviewProvider {
    static var previews: some View {
        List_IgnoresSafeAreaBug()
    }
}
