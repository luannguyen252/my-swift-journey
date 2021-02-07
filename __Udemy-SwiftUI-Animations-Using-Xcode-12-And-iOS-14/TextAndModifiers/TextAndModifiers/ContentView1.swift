import SwiftUI

struct ContentView1: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                Text("SwiftUI. Build Apps. Less Code.").allowsTightening(true)
                Text("SwiftUI. Build Apps. Less Code.".uppercased())
                Text("SwiftUI. Build Apps. Less Code.".lowercased())
                Text("SwiftUI. Build Apps. Less Code.").bold()
                Text("SwiftUI. Build Apps. Less Code.").font(.title)
                Text("SwiftUI. Build Apps. Less Code.").font(.system(size: 16))
                Text("SwiftUI. Build Apps. Less Code.").font(.system(.title, design: .default))
                Text("SwiftUI. Build Apps. Less Code.").font(.system(size: 16, weight: .heavy, design: .default))
                Text("SwiftUI. Build Apps. Less Code.").baselineOffset(10.5)
                Text("SwiftUI. Build Apps. Less Code.").kerning(2)
            }
            
            VStack(spacing: 16) {
                Text("SwiftUI. Build Apps. Less Code.").strikethrough(true, color: .black)
                Text("SwiftUI. Build Apps. Less Code.").underline(true, color: .black)
                Text("SwiftUI. Build Apps. Less Code.").flipsForRightToLeftLayoutDirection(true)
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.").multilineTextAlignment(.center)
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.").multilineTextAlignment(.center).lineLimit(2)
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.").multilineTextAlignment(.center).lineLimit(2).lineSpacing(10.0)
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.").lineLimit(2).truncationMode(.middle)
            }
        }
        .padding(16)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
