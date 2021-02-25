import SwiftUI

struct ContentView: View {
    var body: some View {
        MorphingTabBar(flipped: false) {[
            AnyView(
                Rectangle()
                    .foregroundColor(Color.white)
                    .morphTabItem(Image(systemName: "tv"))
            ),
            AnyView(
               Rectangle()
                .foregroundColor(Color.white)
                    .morphTabItem(Image(systemName: "folder"))
            ),
            AnyView(
                Rectangle()
                .foregroundColor(Color.white)
                    .morphTabItem(Image(systemName: "slider.horizontal.3"))
            ),
            AnyView(
                Rectangle()
                .foregroundColor(Color.white)
                    .morphTabItem(Image(systemName: "lock"))
            )
        ]}
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
