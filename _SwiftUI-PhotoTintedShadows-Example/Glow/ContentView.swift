import SwiftUI

struct ContentView: View {
    @State private var playing = true
    
    var Photo: some View = Image("avatar5")
        .resizable()
        .aspectRatio(contentMode: .fit)

    var body: some View {
        ZStack {
            Color("light").ignoresSafeArea(.all, edges: .all)
            
            Photo
                .cornerRadius(64)
                .blur(radius: 32)
                .offset(y: 10)
                .opacity(playing ? 0.9 : 0)
                .frame(width: playing ? 300 : 260)
                .overlay(Photo.cornerRadius(12))
                .onTapGesture {
                    playing.toggle()
                }
                .animation(.spring(response: 0.3, dampingFraction: 0.5))
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
