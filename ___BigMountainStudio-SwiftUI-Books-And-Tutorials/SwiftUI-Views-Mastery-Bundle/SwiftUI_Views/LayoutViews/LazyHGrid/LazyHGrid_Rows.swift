//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHGrid_Rows: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyHGrid",
                       subtitle: "Rows",
                       desc: "You can specify the number of rows with an array of GridItems.")
            
            Text("Two Rows (2 GridItems):")
            
            let twoRows = [GridItem(), GridItem()]
            
            LazyHGrid(rows: twoRows) {
                ForEach(1 ..< 11) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
            
            Text("Four Rows (4 GridItems):")

            let fourRows = [GridItem(), GridItem(), GridItem(), GridItem()]
            LazyHGrid(rows: fourRows) {
                ForEach(1 ..< 11) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
        }
        .font(.title)
    }
}

struct LazyHGrid_Rows_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGrid_Rows()
    }
}
