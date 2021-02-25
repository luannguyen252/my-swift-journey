//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("GridItems can be used to define rows or columns. Let's define 2 GridItems.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            let gridItems = [
                GridItem(),
                GridItem()
            ]
            
            Text("LazyHGrid: Becomes 2 rows")
            LazyHGrid(rows: gridItems, spacing: 20) {
                ForEach(0 ..< 5) { item in
                    Color.blue
                        .frame(width: 100, height: 60, alignment: .center)
                }
            }
            .frame(height: 150)
            
            Text("LazyVGrid: Becomes 2 columns")
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(0 ..< 5) { item in
                    Color.blue
                        .frame(width: 100, height: 60, alignment: .center)
                }
            }
        }
        .font(.title)
    }
}

struct GridItem_Intro_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_Intro()
    }
}
