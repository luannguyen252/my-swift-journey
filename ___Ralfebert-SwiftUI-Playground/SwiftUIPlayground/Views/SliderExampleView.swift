// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct SliderExampleView: View {

    @State var value = 50.0

    var body: some View {
        Slider(value: $value, in: 1.0 ... 100.0) {
            Text("Value \(value)")
        }
    }
}

struct SliderExample_Previews: PreviewProvider {
    static var previews: some View {
        SliderExampleView()
    }
}
