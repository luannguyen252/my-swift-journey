import SwiftUI

struct ContentView: View {
    let text = Text("""
SwiftUI
Build Apps
Less Code.
""")
        .font(.custom("TTFirsNeue-Bold", size: 56))
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            text
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("orange"), Color("red"), Color("purple"), Color("blue")]),
                        startPoint: .trailing,
                        endPoint: .leading
                    )
                    .mask(text))
                .padding(16)
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
