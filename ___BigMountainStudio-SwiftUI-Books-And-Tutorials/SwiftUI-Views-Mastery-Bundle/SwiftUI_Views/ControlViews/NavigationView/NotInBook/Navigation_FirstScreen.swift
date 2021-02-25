//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Navigation_FirstScreen: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Navigating to a Navigation View doesn't seem to work")
            NavigationLink("Go to Nav Screen", destination: Navigation_BackgroundColor())
        }
    }
}

struct Navigation_FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_FirstScreen()
    }
}
