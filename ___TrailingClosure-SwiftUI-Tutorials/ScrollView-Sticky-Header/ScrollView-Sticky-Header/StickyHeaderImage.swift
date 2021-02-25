import SwiftUI

struct StickyHeaderImage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                StickyHeader {
                    Image("mac1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            
            VStack {
                Text("""
                    SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.
                    """)
            }
            .padding(16)
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct StickyHeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeaderImage()
    }
}
#endif
