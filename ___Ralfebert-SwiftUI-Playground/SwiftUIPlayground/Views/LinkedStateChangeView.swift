// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// from https://stackoverflow.com/questions/61831034/swiftui-display-doesnt-update-on-child-link-changing-the-state
struct LinkedStateChangeView: View {
    @State var enabled: Bool = false
    @State var items: [String] = ["item"]

    var body: some View {
        NavigationView {
            Section {
                ForEach(self.items, id: \.self) { _ in
                    NavigationLink(destination: Toggle(isOn: self.$enabled) { Text("enable") }) {
                        if self.enabled {
                            Text("enabled")
                        } else {
                            Text("disabled")
                        }
                    }
                }
            }
        }
    }
}

struct LinkedStateChangeView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedStateChangeView()
    }
}
