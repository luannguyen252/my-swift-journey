// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ToggleExampleView: View {
    @State var value = true

    var body: some View {
        Toggle(isOn: $value) {
            Text("Value \(String(describing: value))")
        }
    }
}

struct ToggleExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleExampleView()
    }
}
