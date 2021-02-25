import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            textWithHashtags("SwiftUI is an #innovative, exceptionally simple way to build #UserInterfaces across all #ApplePlatforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and #APIs.",
                             color: Color("pink2"))
                .font(Font.custom("TTFirsNeue-Bold", size: 24))
                .foregroundColor(Color("light"))
                .padding(16)
        }
        .statusBar(hidden: true)
    }
}

// Config Text With Hashtags
func textWithHashtags(_ text: String, color: Color) -> Text {
    let words = text.split(separator: " ")
    var output: Text = Text("")

    for word in words {
        if word.hasPrefix("#") { // Pick out hash in words
            output = output + Text(" ") + Text(String(word))
                .foregroundColor(color) // Add custom styling here
        } else {
            output = output + Text(" ") + Text(String(word))
        }
    }
    return output
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
