//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Edges_Landscape_Before: View {
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
            
            Text("In this landscape example, you can see the extent of the safe area edges.")
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.orange)
        }
        .border(Color.red)
        .font(.title)
    }
}

struct Edges_Landscape_Before_Previews: PreviewProvider {
    static var previews: some View {
        Edges_Landscape_Before()
            .preferredColorScheme(.dark)
    }
}
