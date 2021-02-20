// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct StepperExampleView: View {
    @State var value = 50

    var body: some View {
        Stepper("Value \(value)", value: $value, in: 1 ... 100)
    }
}

struct StepperExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StepperExampleView()
    }
}
