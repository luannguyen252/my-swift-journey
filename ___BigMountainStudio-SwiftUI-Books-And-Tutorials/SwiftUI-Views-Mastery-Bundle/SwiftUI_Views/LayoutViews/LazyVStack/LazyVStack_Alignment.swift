//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVStack_Alignment: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("LazyVStack",
                       subtitle: "Alignment",
                       desc: "Since LazyVStacks are push-out views (horizontally) the alignment parameter could be useful.")
            
            Text("Leading")
            
            LazyVStack(alignment: .leading, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2) // Draws a border around the frame of the view
            
            Text("Trailing")
            
            LazyVStack(alignment: .trailing, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
        }
        .font(.title)
    }
}

struct LazyVStack_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_Alignment()
    }
}
