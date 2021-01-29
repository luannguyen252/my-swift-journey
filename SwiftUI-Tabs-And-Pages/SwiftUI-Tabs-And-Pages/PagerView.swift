import SwiftUI

struct PagerView: View {
    @State private var selection = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                Text("Hello").tag(0)
                Text("World").tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

            Button("next") {
                withAnimation {
                    selection = 1
                }
            }
        }
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView()
    }
}
