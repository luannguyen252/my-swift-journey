import SwiftUI

struct ContentView: View {
    @State var showOverlay = false
    @State var curColor = Color.blue
    
    var body: some View {
        Text("Click me to select color")
            .frame(width: 120, height: 120)
            .background(curColor)
            .cornerRadius(60)
            .onTapGesture { self.showOverlay.toggle() }
            .overlay(ArcSelectionView(isShowing: self.$showOverlay, curColor: self.$curColor))
    }
}

// Arc Selection View
struct ArcSelectionView: View {
    @Binding var isShowing: Bool
    @Binding var curColor: Color
    let colors = [Color.blue, Color.red, Color.green, Color.yellow]
    
    // Body
    var body: some View {
        ZStack {
            ForEach(1 ..< 5, id: \.self) { item in
                Circle()
                    .trim(from: self.isShowing ? CGFloat((Double(item) * 0.25) - 0.25) : CGFloat(Double(item) * 0.25),
                          to: CGFloat(Double(item) * 0.25))
                    .stroke(self.colors[item - 1], lineWidth: 30)
                    .frame(width: 300, height: 300)
                    .animation(.linear(duration: 0.4))
                    .onTapGesture {
                        self.curColor = self.colors[item - 1]
                        self.isShowing.toggle()
                }
            }
        } //: ZSTACK
        .opacity(self.isShowing ? 1 : 0)
        .rotationEffect(.degrees(self.isShowing ? 0 : 180))
        .animation(.linear(duration: 0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
