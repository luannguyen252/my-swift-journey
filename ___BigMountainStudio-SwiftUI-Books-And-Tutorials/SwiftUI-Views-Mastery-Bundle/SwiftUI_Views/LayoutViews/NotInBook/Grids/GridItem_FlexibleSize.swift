//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_FlexibleSize: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Flexible Size")
                .foregroundColor(.gray)
            
            Text("GridItems can make the repeated views become push-out views with flexible sizing.")
                .frame(maxWidth: .infinity)
                .padding().layoutPriority(2)
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Text("GridItem(.flexible())")
                .bold()
            
            let gridItem = [GridItem(GridItem.Size.flexible())]
            
            Text("For HGrids, this means height:")
            LazyHGrid(rows: gridItem){
                    Color.blue
                        .frame(width: 40)
                    Color.blue
                    Color.blue
                        .frame(width: 40)
            }
            .layoutPriority(1) // Allow the views to expand more vertically
            
            Text("For VGrids, this means width:")
                .padding(.top)
            LazyVGrid(columns: gridItem){
                Group {
                    Color.blue
                    Color.blue
                    Color.blue
                }
            }
        }
        .font(.title)
    }
}

struct GridItem_FlexibleSize_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_FlexibleSize()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
