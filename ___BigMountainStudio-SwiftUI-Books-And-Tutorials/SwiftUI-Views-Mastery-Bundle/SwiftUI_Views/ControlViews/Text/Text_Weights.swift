//
//  100Views
//
//  Created by Mark Moeykens on 6/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_Weights : View {
    var body: some View {
        return VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            Text("Font Weights")
                .font(.title)
                .foregroundColor(.gray)
            Image("FontWeight")
            Text("You can apply a variety of font weights to the Text view.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title)
                .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
            Group { // Too many views (> 10) in one container
                Text("Ultralight")
                    .fontWeight(.ultraLight)
                Text("Thin")
                    .fontWeight(.thin)
                Text("Light")
                    .fontWeight(.light)
                Text("Regular")
                    .fontWeight(.regular)
                Text("Medium")
                    .fontWeight(.medium)
                Text("Semibold")
                    .fontWeight(.semibold)
                Text("Bold")
                    .fontWeight(.bold)
                Text("Heavy")
                    .fontWeight(.heavy)
                Text("Black")
                    .fontWeight(.black)
            }.font(.title)
        }
    }
}

struct Text_Weights_Previews : PreviewProvider {
    static var previews: some View {
        Text_Weights()
    }
}
