import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                ZStack {
                    Color("dark")
                    VStack(spacing: 8) {
                        Text("SwiftUI")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("light"))
                        Text("Build Apps. Less Code.")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(Color("dark4"))
                    }
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

// Sticky Header
struct StickyHeader<Content: View>: View {
    var minHeight   : CGFloat
    var content     : Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.minHeight  = minHeight
        self.content    = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            if(geo.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            } else {
                content
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
            }
        }
        .frame(minHeight: minHeight)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
