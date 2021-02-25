//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ColorPicker_OpacityOption: View {
    @State private var color = Color.pink

    var body: some View {
        VStack(spacing: 40) {
            HeaderView("ColorPicker",
                       subtitle: "Opacity Option",
                       desc: "By default, the color picker shows an opacity option. You can disable this option.",
                       back: color)
            
            ColorPicker("Pick a Color",
                        selection: $color)
                .padding(.horizontal)
            
            ColorPicker("Pick a Color (No Opacity)",
                        selection: $color,
                        supportsOpacity: false)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct ColorPicker_OpacityOption_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker_OpacityOption()
    }
}
