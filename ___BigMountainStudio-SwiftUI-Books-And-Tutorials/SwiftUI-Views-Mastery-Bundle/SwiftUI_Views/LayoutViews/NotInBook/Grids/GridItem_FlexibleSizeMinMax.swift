//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_FlexibleSizeMinMax: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Flexible Size - Min & Max")
                .foregroundColor(.gray)
            
            Text("Flexible sizing can also define a minimum and maximum size for the repeated views.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Text("GridItem(.flexible(minimum: 20, maximum: 85))")
                .bold()
            
            let gridItem = [GridItem(.flexible(minimum: 20, maximum: 85))]
            
            Text("For HGrids, this means height:")
            LazyHGrid(rows: gridItem){
                    Color.blue
                        .frame(width: 40)
                    Color.blue
                        .frame(width: 40)
                    Color.blue
            }
            
            Text("For VGrids, this means width:")
            LazyVGrid(columns: gridItem){
                Group {
                    Color.blue
                        .frame(height: 20)
                    Color.blue
                    Color.blue
                }
            }
        }
        .font(.title)
    }
}

struct GridItem_FlexibleSizeMinMax_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_FlexibleSizeMinMax()
    }
}
