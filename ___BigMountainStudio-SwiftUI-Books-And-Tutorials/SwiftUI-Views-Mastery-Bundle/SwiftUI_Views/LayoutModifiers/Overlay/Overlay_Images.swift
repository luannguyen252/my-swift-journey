//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Overlay_Images: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Overlay")
                .font(.largeTitle)
            
            Text("Over Images with Alignment")
                .font(.title)
                .foregroundColor(.gray)
            
            Image("Overlay")
            
            Text("Overlays are great when showing text over images.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Image("canyonlands")
                .resizable()
                .overlay(Rectangle()
                    .frame(height: 80)
                    .opacity(0.5), alignment: .bottom)
                .overlay(Text("Canyonlands")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom), alignment: .bottom)
        }
    }
}

struct Overlay_Images_Previews: PreviewProvider {
    static var previews: some View {
        Overlay_Images()
    }
}
