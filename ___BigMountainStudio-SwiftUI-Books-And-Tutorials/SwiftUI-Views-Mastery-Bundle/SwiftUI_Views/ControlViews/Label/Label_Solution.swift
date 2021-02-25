//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Label_Solution: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Label",
                       subtitle: "Solution",
                       desc: "The Label can help with the alignment of images and text from row-to-row in a List.",
                       back: .pink)
            
            List {
                Label("Edit", systemImage: "rectangle.and.pencil.and.ellipsis")
                Label("Archives", systemImage: "archivebox.circle")
                Label("Document", systemImage: "doc.richtext")
                Label("Camera Settings", systemImage: "camera.badge.ellipsis")
            }
            .padding(.horizontal)
            
            DescView(desc: "The text will continue to be aligned, even if the text size changes with accessibility settings.", back: .pink)
        }
        .font(.title)
    }
}

struct Label_Solution_Previews: PreviewProvider {
    static var previews: some View {
        Label_Solution()
    }
}
