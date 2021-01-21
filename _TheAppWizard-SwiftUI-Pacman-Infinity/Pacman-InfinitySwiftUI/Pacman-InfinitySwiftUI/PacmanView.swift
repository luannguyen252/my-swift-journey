import SwiftUI

struct PacmanView: View {
    @State var packman = false
    
    var body: some View {
        ZStack {
            Image("pc2")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
        
            Image("pc1")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .opacity(packman ? 1: 0)
                .animation(Animation.easeInOut(duration: 0.1).delay(0.1).repeatForever(autoreverses: true))
                .onAppear(){ self.packman.toggle() }
        }
    }
}

struct PacmanView_Previews: PreviewProvider {
    static var previews: some View {
        PacmanView()
    }
}
