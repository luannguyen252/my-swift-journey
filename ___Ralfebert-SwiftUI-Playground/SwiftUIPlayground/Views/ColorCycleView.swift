// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// from https://stackoverflow.com/questions/61831799/changes-are-not-reflected-in-foreach-in-swiftui
struct ColorCycleView: View {
    @State var index: Int = 0

    var colors = [Color.red, Color.blue, Color.orange, Color.green]

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .fill(self.colors[index])
                    .frame(width: 100, height: 100)
            }
            .navigationBarTitle("Color cycle")
            .navigationBarItems(trailing:
                Button("Next color") {
                    self.index = (self.index + 1) % self.colors.count
                }
            )
        }
    }
}

struct ColorCycleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCycleView()
    }
}
