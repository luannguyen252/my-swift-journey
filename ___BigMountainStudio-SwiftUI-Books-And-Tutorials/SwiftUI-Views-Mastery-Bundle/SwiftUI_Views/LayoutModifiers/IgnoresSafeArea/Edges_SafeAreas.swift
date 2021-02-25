//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Edges_SafeAreas: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Safe Area",
                       subtitle: "Introduction",
                       desc: "The Safe Area is the part of the screen that your views can be displayed fully, without being cut off by a notch, rounded corners or the home indicator at the bottom of the screen.",
                       back: .orange)
        }
        .font(.title)
        .frame(maxHeight: .infinity)
        .background(Color.orange.opacity(0.15))
        .border(Color.orange)
    }
}

struct Edges_SafeAreas_Previews: PreviewProvider {
    static var previews: some View {
        Edges_SafeAreas()
            .preferredColorScheme(.dark)
    }
}
