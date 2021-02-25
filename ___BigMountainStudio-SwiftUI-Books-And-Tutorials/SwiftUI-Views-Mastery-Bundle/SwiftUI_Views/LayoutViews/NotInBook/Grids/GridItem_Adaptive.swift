//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_Adaptive: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Adaptive Size")
                .foregroundColor(.gray)
            
            Text("Adaptive spacing will use the available space to try to fit as many rows/columns as possible by giving each view a minimum value (which represents height for LazyHGrid and width for LazyVGrid). This means wrapping views.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Text("GridItem(.adaptive(minimum: 20))")
                .bold()
            
            let gridItem = [GridItem(.adaptive(minimum: 20))]
            
            Text("HGrids: Fit as many vertically, then wrap:")
                .font(.body)
            LazyHGrid(rows: gridItem){
                ForEach(1 ..< 11) { index in
                    Image(systemName: "\(index).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .frame(height: 100)
            
            Text("VGrids: Fit as many horizontally, then wrap:")
                .font(.body)
            LazyVGrid(columns: gridItem){
                ForEach(1 ..< 21) { index in
                    Image(systemName: "\(index).circle")
                }
                Image(systemName: "arrow.down.circle")
            }
        }
        .font(.title)
    }
}

struct GridItem_Adaptive_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_Adaptive()
            .previewDevice("iPhone 11")
    }
}
