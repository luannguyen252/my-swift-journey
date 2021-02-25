//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_Spacing_LazyVGrid: View {
    @State private var minSpacing: CGFloat = 10
    @State private var maxSpacing: CGFloat = 20
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("GridItem")
                    .font(.largeTitle)
                
                Text("Spacing")
                    .foregroundColor(.gray)
                
                Text("You can adjust minimum and maximum spacing between views in a grid.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
            }
            
            let gridItem = [GridItem(.adaptive(minimum: minSpacing, maximum: maxSpacing))]
            
            Text("LazyVGrid")
            LazyVGrid(columns: gridItem, spacing: 20){
                ForEach(0 ..< 40) { index in
                    Image(systemName: "\(index).circle")
                        .frame(width: 20, height: 20)
                }
                Image(systemName: "arrow.right.circle")
            }
            .frame(maxHeight: .infinity)
            .border(Color.blue)
            
            VStack {
                Slider(value: $minSpacing, in: 0...40, step: 5, minimumValueLabel: Text("0"), maximumValueLabel: Text("40")) { Text("Minimum Spacing")}
                Text("Minimum Spacing: \(Int(minSpacing))")
                    .padding(.bottom)
                
                Slider(value: $maxSpacing, in: 20...50, step: 5, minimumValueLabel: Text("20"), maximumValueLabel: Text("50")) { Text("Minimum Spacing")}
                Text("Maximum Spacing: \(Int(maxSpacing))")
            }
            .padding(.horizontal)
        }
        .animation(.default)
        .font(.title)
    }
}

struct GridItem_Spacing_LazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_Spacing_LazyVGrid()
            .previewDevice("iPhone 11")
    }
}
