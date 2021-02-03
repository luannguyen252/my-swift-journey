import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("dark").edgesIgnoringSafeArea(.all)
            
            TabView {
                ForEach(0 ..< 24) { i in
                    ZStack {
                        Color("dark2")
                        Text("Page \(i)")
                            .font(.custom("TTFirsNeue-Bold", size: 40))
                            .foregroundColor(Color("pink2"))
                    }
                    .cornerRadius(16)
                }
                .padding(.top, 16)
                .padding(.bottom, 8)
                .padding(.horizontal, 16)
            }
            .frame(width: UIScreen.main.bounds.width, height: 400)
            .tabViewStyle(PageTabViewStyle())
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
