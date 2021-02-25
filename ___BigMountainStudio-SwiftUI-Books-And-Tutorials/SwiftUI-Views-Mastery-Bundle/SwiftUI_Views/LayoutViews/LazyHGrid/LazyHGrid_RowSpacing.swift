//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHGrid_RowSpacing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("LazyHGrid",
                       subtitle: "Row Spacing",
                       desc: "Specify the amount of spacing beneath each row by using the GridItem's spacing parameter. This can be used with any GridItem.Size option: fixed, flexible, or adaptive.")
            
            Text("Top Row Spacing: 40")
            
            Text("Middle Row Spacing: 20")
            
            let rows = [GridItem(spacing: 40),
                        GridItem(spacing: 20),
                        GridItem()]
            
            LazyHGrid(rows: rows) {
                ForEach(1 ..< 11) { item in
                    Color.green
                        .frame(width: 50)
                }
            }
        }
        .font(.title)
    }
}

struct LazyHGrid_RowSpacing_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGrid_RowSpacing()
    }
}
