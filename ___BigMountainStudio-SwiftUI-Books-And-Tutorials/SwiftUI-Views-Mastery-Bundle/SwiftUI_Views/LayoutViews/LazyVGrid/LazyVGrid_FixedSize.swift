//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVGrid_FixedSize: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyVGrid",
                       subtitle: "Fixed Width",
                       desc: "Give items in the LazyVGrid a fixed width using the GridItem. This will effectively change the width for the entire column.")
            
            Text("Fixed Cols: 50, 50, 50, 0, 150")
            
            let columns = [GridItem(GridItem.Size.fixed(50)),
                           GridItem(.fixed(50)),
                           GridItem(.fixed(50)),
                           GridItem(.fixed(0)),
                           GridItem(.fixed(150))]
            
            LazyVGrid(columns: columns) {
                ForEach(1 ..< 11) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.down.circle")
            }
            .font(.largeTitle)
        }
        .font(.title)
    }
}

struct LazyVGrid_FixedSize_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_FixedSize()
    }
}
