//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AccentColor_ColorProperty: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("AccentColor",
                       subtitle: "Color Property",
                       desc: "You can also access the accent color defined in the Asset catalog through the Color's dedicated 'accentColor` property.", back: .purple, textColor: .white)
            
            Circle()
                .fill(Color.accentColor)
                .overlay(Image(systemName: "candybarphone")
                            .font(Font.system(size: 150, weight: .thin))
                            .foregroundColor(.white))
                .frame(width: 200)
        }
        .font(.title)
    }
}

struct AccentColor_ColorProperty_Previews: PreviewProvider {
    static var previews: some View {
        AccentColor_ColorProperty()
    }
}
