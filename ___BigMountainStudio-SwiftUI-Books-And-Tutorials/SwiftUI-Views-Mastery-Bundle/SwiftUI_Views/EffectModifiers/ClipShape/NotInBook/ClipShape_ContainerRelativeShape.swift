//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ClipShape_ContainerRelativeShape: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("ClipShape").font(.largeTitle)
            Text("ContainerRelativeShape").font(.title).foregroundColor(.gray)
            Text("Not quite working the way I expected. Might be specialized for Widgets?")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.blue)
                .foregroundColor(.white)
            
            VStack {
                Text("My Trip")
                    .padding(.top)
                Image("yosemite")
                    .clipShape(ContainerRelativeShape())
            }
            .background(Rectangle().fill(Color.secondary))
            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .background(RoundedRectangle(cornerRadius: 20).fill(Color.secondary))
            
            Button(action: {}) {
                Text("Click Me")
            }
        }
    }
}

struct ClipShape_ContainerRelativeShape_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_ContainerRelativeShape()
    }
}
