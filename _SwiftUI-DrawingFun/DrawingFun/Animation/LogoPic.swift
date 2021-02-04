import SwiftUI

struct LogoPic: View {
    @State var multiplier = 0.0
    @State var show = false
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            if show {
                YellowSmileyFace()
                    .rotationEffect(.degrees(180 * multiplier))
                    .transition(.slide)
                    .animation(.spring(response: 0.2))
            }
            
            Button(action: {
                self.multiplier += 0.333
                self.show.toggle()
            }) {
                Text("Animation")
                    .frame(width: 300, height: 700, alignment: .bottom)
                    .foregroundColor(.white).font(.system(size: 25))
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct LogoPic_Previews: PreviewProvider {
    static var previews: some View {
        LogoPic()
    }
}
#endif
