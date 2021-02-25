//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TabView_PageTabViewStyle: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                HeaderView("TabView",
                           subtitle: "PageTabViewStyle",
                           desc: "The tab view can have a style applied to it which enables the ability to horizontally swipe through views that snap into place.")
                Text("PAGE")
                HStack {
                    Image(systemName: "1.circle")
                    Image(systemName: "arrow.right.circle")
                }
            }

            VStack {
                Text("PAGE")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "arrow.right.circle")
                }
            }
            VStack {
                Text("PAGE")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "3.circle")
                }
            }
        }
        .font(.title)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct TabView_PageTabViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        TabView_PageTabViewStyle()
    }
}
