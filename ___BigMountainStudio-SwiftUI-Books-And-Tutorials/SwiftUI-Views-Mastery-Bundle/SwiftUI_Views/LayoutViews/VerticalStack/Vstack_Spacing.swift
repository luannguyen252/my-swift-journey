//  Copyright © 2020 Big Mountain Studio. All rights reserved.

import SwiftUI

struct Vstack_Spacing: View {
    var body: some View {
        VStack(spacing: 60) {
            Text("VStack")
                .font(.largeTitle)
            
            Text("Spacing")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("The VStack initializer allows you to set the spacing between all the views inside the VStack")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue).font(.title)
                .foregroundColor(.white)
            
            Image(systemName: "arrow.up.and.down.circle.fill")
                .font(.largeTitle)
            
            Text("The spacing here between all of these views is 60")
                .font(.title)
            
        }
    }
}

struct Vstack_Spacing_Previews: PreviewProvider {
    static var previews: some View {
        Vstack_Spacing()
    }
}
