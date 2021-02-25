//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyHStack_Alignment: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyHStack",
                       subtitle: "Alignment",
                       desc: "Since LazyHStacks are push-out views (vertically) the alignment parameter could be useful.")
                .layoutPriority(1)
            
            Text("Top")
            
            LazyHStack(alignment: .top, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2) // Draws a border around the frame of the view
            
            Text("Bottom")
            
            LazyHStack(alignment: .bottom, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
        }
        .font(.title)
    }
}

struct LazyHStack_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack_Alignment()
    }
}
