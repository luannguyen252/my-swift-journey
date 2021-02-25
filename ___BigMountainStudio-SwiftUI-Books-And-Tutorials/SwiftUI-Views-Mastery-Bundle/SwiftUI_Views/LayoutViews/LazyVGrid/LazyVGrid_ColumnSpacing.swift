//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVGrid_ColumnSpacing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("LazyVGrid",
                       subtitle: "Column Spacing",
                       desc: "Specify the amount of spacing to the right of each column by using the GridItem's spacing parameter. This can be used with any GridItem.Size option: fixed, flexible, or adaptive.")
            
            Text("Column Spacing")
            
            HStack {
                Text("40")
                Spacer()
                Text("2").padding(.leading, 40)
                Spacer()
                Text("20")
                Spacer()
                Text("None")
            }.padding(.horizontal)
            
            let columns = [GridItem(spacing: 40),
                           GridItem(spacing: 2),
                           GridItem(spacing: 20),
                           GridItem()]
            
            LazyVGrid(columns: columns) {
                ForEach(1 ..< 21) { item in
                    Color.green
                        .frame(height: 50)
                }
            }
        }
        .font(.title)
    }
}

struct LazyVGrid_ColumnSpacing_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_ColumnSpacing()
    }
}
