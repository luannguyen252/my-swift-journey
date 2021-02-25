//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_AdaptiveExamples: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Adaptive - Examples")
                .foregroundColor(.gray)
            
            Text("Notice the difference...")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Text("GridItem(.adaptive(minimum: 20))")
                .bold()
                .font(.body)
            
            let gridItem = [GridItem(.adaptive(minimum: 20))]
            
            Text("HGrids: Fit as many views vertically, given each view is at least 20 tall:")
            LazyHGrid(rows: gridItem){
                ForEach(1 ..< 11) { index in
                    Image(systemName: "\(index).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .frame(height: 100)
            .border(Color.blue)
            
            Text("GridItem(.adaptive(minimum: 40))")
                .bold()
            
            let gridItem2 = [GridItem(.adaptive(minimum: 40))]
            
            Text("HGrids: Fit as many views vertically, given each view is at least 40 tall:")
                .font(.body)
            LazyHGrid(rows: gridItem2){
                ForEach(1 ..< 11) { index in
                    Image(systemName: "\(index).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .frame(height: 100)
            .border(Color.blue)
        }
    }
}

struct GridItem_AdaptiveExamples_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_AdaptiveExamples()
    }
}
