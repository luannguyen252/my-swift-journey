import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            ColorList(colors: [Color("purple"), Color("orange"), Color("red"), Color("pink"), Color("pink2"), Color("purple2"), Color("yellow")])
                .offset(y: 120)
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
