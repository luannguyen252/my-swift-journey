// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct InnerView: View {
    @State var count = 1

    var body: some View {
        Button("Inner Count \(count)") { self.count += 1 }
            .border(Color.blue)
            .padding()
    }
}

struct StateExampleView: View {
    @State var count = 1

    var body: some View {
        VStack {
            Button("Outer Count \(count)") { self.count += 1 }
            InnerView()
        }
        .border(Color.red)
        .padding()
    }
}

struct StateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StateExampleView()
    }
}
