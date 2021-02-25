import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            Rectangle()
                .cornerRadius(10)
                .frame(width: 200, height: 200, alignment: .center)
                .modifier(LikeModifier {
                    // Update model here...
                })
        }
        .statusBar(hidden: true)
    }
}

extension View {
    func onFavorite(callback: @escaping ()->()) -> some View {
        return self.modifier(LikeModifier(callback: callback))
    }
}

// Like Modifier
struct LikeModifier: ViewModifier {
    @State var liked: Bool = false
    var callback: () -> ()
    
    func body(content: Content) -> some View {
        content
        .overlay(
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 15, height: 15, alignment: .center)
                .padding(10.5)
                .background(Color.red)
                .cornerRadius(18)
                .opacity(self.liked ? 1.0 : 0)
                .scaleEffect(self.liked ? 1.0 : 0, anchor: .center)
                .animation(.easeIn(duration: 0.2))
                .offset(x: 18, y: -18), alignment: .topTrailing)
            .gesture(
                TapGesture(count: 2)
                    .onEnded({
                        withAnimation {
                            self.liked = !self.liked
                        }
                        // Fire the callback so we can update the model.
                        self.callback()
                    })
            )
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
