//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TabView_PageTabViewStyle_FullScreen: View {
    var body: some View {
        TabView{
            Color.red
            Color.purple
            Color.pink
            Color.blue
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct TabView_PageTabViewStyle_FullScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabView_PageTabViewStyle_FullScreen()
    }
}
