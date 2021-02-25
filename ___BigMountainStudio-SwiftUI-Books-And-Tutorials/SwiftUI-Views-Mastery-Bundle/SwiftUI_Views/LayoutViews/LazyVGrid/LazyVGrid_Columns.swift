//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVGrid_Columns: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyVGrid",
                       subtitle: "Columns",
                       desc: "You can specify the number of columns with an array of GridItems.")
            
            Text("Three Columns (3 GridItems):")
            
            let threeColumns = [GridItem(), GridItem(), GridItem()]
            
            LazyVGrid(columns: threeColumns) {
                ForEach(1 ..< 10) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.down.circle")
            }
            .font(.largeTitle)
            
            Text("Five Columns (5 GridItems):")

            let fiveColumns = [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]
            
            LazyVGrid(columns: fiveColumns) {
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

struct LazyVGrid_Columns_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_Columns()
    }
}
