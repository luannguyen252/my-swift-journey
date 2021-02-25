//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct State_Previewing: View {
    // The @State properties would have to be public
    @State var featureOne: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("State",
                       subtitle: "Previewing",
                       desc: "You can create static @State variables in your Preview to test with different values.", back: .blue, textColor: .white)
            
            Toggle("Feature One", isOn: $featureOne)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct State_Previewing_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            State_Previewing(featureOne: false)
                .previewLayout(.sizeThatFits)
            State_Previewing(featureOne: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
