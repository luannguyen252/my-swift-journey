//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Edges_Landscape_After: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Ignores Safe Area")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .background(Color.orange)
            
            Text("Landscape")
                .foregroundColor(.gray)
            
            Text("You can ignore multiple edges at the same time by using an array.")
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange)
        }
        .font(.title)
        .ignoresSafeArea(edges: [.horizontal, .bottom])
    }
}

struct Edges_Landscape_After_Previews: PreviewProvider {
    static var previews: some View {
        Edges_Landscape_After()
    }
}
