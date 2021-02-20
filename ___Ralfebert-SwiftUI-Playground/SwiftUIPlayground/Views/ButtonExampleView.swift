// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ButtonExampleView: View {

    @State var count = 0

    var body: some View {
        VStack(spacing: 10.0) {
            Button("Button was tapped \(count) times") {
                self.count += 1
            }

            Button(
                action: {
                    self.count += 1
                }, label: {
                    Text("Another Button")
                }
            )

            Button(
                action: {
                    self.count += 1
                }, label: {
                    Image(systemName: "sun.max")
                }
            )
        }
        .padding([.top, .bottom], 10)

    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
