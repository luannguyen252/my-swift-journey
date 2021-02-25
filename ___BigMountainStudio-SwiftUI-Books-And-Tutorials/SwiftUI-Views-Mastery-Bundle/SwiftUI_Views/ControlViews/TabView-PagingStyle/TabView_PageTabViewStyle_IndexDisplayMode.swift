//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TabView_PageTabViewStyle_IndexDisplayMode: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                HeaderView("TabView",
                           subtitle: "Index Display Mode",
                           desc: "You can also get rid of the paging index dots using the parameter indexDisplayMode and setting it to .never.")
                Text("PAGE 1")
                
                Spacer()
                
                DescView(desc: "There is also another option which is .automatic which will only show dots if the TabView has more than one view within it.")
            }
            
            VStack {
                Text("PAGE 2")
            }
            VStack {
                Text("PAGE 3")
            }
        }
        .font(.title)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct TabView_PageTabViewStyle_IndexDisplayMode_Previews: PreviewProvider {
    static var previews: some View {
        TabView_PageTabViewStyle_IndexDisplayMode()
    }
}
