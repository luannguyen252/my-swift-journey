// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct TextExampleView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Hamlet")
                .font(.title)

            Text("by William Shakespeare")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()

            Text("To be, or not to be, that is the question:")
                .frame(width: 100)

            Text("Brevity is the soul of wit.")
                .frame(width: 100)
                .lineLimit(1)
        }
    }
}

struct TextExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextExampleView()
    }
}
