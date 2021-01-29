import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Text("View Transition")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("dark"))
                .padding()
                // .background(Capsule().stroke())
                .background(Capsule().fill(Color("pink2")))
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
            
            if show {
                NewView(show: $show)
                    .transition(.move(edge: .bottom)) // .bottom, .top, .leading, .trailing
                    .zIndex(1)
            }
        }
        .statusBar(hidden: true)
    }
}

struct NewView: View {
    @Binding var show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color("pink2"))
            .padding()
            .onTapGesture {
                withAnimation(.easeOut) {
                    show.toggle()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
