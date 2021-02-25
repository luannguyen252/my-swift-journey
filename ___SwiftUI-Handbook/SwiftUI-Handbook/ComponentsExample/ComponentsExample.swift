import SwiftUI

struct ComponentsExample: View {
    var body: some View {
        LargeButton(text: "Download")
    }
}

#if DEBUG
struct ComponentsExample_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsExample()
    }
}
#endif
