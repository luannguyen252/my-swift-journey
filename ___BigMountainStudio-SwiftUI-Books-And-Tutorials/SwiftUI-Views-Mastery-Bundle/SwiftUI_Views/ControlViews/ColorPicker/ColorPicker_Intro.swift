//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ColorPicker_Intro: View {
    @State private var color = Color.pink
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ColorPicker",
                       subtitle: "Introduction",
                       desc: "Use the ColorPicker to provide your users with color options. You will need to bind it to a color variable to store the color selected.",
                       back: color)
            
            Spacer()
            
            ColorPicker("Pick a Color", selection: $color)
                .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
    }
}

struct ColorPicker_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker_Intro()
    }
}
