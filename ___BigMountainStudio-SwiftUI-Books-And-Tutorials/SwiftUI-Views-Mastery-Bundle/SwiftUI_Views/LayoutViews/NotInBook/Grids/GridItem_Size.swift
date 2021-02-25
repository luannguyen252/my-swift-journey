//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_Size: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Fixed Size")
                .foregroundColor(.gray)
            
            Text("GridItems can be used to define the size of views that are repeated in a grid.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Spacer()
            
            Text("GridItem(.fixed(50))")
                .bold()
            
            // One fixed size GridItem means one row/column
            let gridItem = [GridItem(GridItem.Size.fixed(50))]
            
            Text("For HGrids, this means height:")
            LazyHGrid(rows: gridItem){
                Group {
                    Color.blue
                    Color.blue
                    Color.blue
                }
            }
            
            Text("For VGrids, this means width:")
            LazyVGrid(columns: gridItem){
                Group {
                    Color.blue
                    Color.blue
                    Color.blue
                }
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct GridItem_Size_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_Size()
    }
}
