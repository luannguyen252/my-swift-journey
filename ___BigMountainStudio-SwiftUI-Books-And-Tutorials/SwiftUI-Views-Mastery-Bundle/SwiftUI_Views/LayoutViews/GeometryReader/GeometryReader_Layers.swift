//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GeometryReader_Layers: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader", subtitle: "Layers", desc: "The child views within a GeometryReader will stack on top of each other, much like a ZStack.",
                       back: .clear)
            
            GeometryReader {_ in
                Image(systemName: "18.circle")
                    .padding()
                Image(systemName: "20.square")
                    .padding()
                Image(systemName: "50.circle")
                    .padding()
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_Layers_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_Layers()
    }
}
