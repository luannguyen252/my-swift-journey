import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                Text("Large Title")
                    .font(.largeTitle) /// The font style for large titles.
                Text("Title")
                    .font(.title) /// The font used for first level hierarchical headings.
                Text("Title2")
                    .font(.title2) /// The font used for second level hierarchical headings.
                Text("Title3")
                    .font(.title3) /// The font used for third level hierarchical headings.
                Text("Headline")
                    .font(.headline) /// The font used for headings.
                Text("Subheadline")
                    .font(.subheadline) /// The font used for subheadings.
            }
            VStack {
                Text("Body")
                    .font(.body) /// The font used for body text.
                Text("Callout")
                    .font(.callout) /// The font used for callouts.
                Text("Footnote")
                    .font(.footnote) /// The font used in footnotes.
                Text("Caption")
                    .font(.caption) /// The font used for standard captions.
                Text("Caption2")
                    .font(.caption2) /// The font used for alternate captions.
            }
        }
    }
}

// MARK: - PREVIEWS
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
#endif
