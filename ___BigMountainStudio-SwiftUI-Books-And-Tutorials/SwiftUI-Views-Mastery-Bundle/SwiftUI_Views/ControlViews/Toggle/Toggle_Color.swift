//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toggle_Color: View {
    @State private var isToggleOn = true
    
    var body: some View {
            VStack(spacing: 40) {
                HeaderView("Toggle",
                           subtitle: "Color",
                           desc: "You can change the color of the Toggle through the SwitchToggleStyle.", back: .blue, textColor: .white)
            
            Group {
                Toggle(isOn: $isToggleOn) {
                    Text("Red")
                    Image(systemName: "paintpalette")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.red))
                
                Toggle(isOn: $isToggleOn) {
                    Text("Orange")
                    Image(systemName: "paintpalette")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Toggle_Color_Previews: PreviewProvider {
    static var previews: some View {
        Toggle_Color()
    }
}
