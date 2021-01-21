import SwiftUI

// Rounded Rectangle Shape
struct roundedrect: View {
    var body: some View {
        Capsule()
            .offset(y : 38)
            .frame(width: 50, height: 70, alignment: .center)
            .opacity(0.7)
    }
}

// Animation
struct LogoView: View {
    @State var blue = false
    @State var purple = false
    @State var pink = false
    @State var red = false
    @State var orange = false
    @State var yellow = false
    @State var green = false
    @State var greentwo = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 170, height: 170, alignment: .center)
                .foregroundColor(.black)
                .shadow(color: .gray, radius: 1.5, x: 0.0, y: 0.0)
            
            roundedrect()
                .foregroundColor(.blue)
            
            roundedrect()
                .foregroundColor(.purple)
                .rotationEffect(.degrees(purple ? 45 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.purple.toggle() }
            
            roundedrect()
                .foregroundColor(.pink)
                .rotationEffect(.degrees(pink ? 90 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.pink.toggle() }
            
            roundedrect()
                .foregroundColor(.red)
                .rotationEffect(.degrees(red ? 135 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.red.toggle() }
            
            roundedrect()
                .foregroundColor(.orange)
                .rotationEffect(.degrees(orange ? 180 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.orange.toggle() }
            
            roundedrect()
                .foregroundColor(.yellow)
                .rotationEffect(.degrees(yellow ? 230 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.yellow.toggle() }
            
            roundedrect()
                .foregroundColor(.green)
                .rotationEffect(.degrees(green ? 270 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.green.toggle() }
            
            roundedrect()
                .foregroundColor(.green)
                .rotationEffect(.degrees(greentwo ? 315 : 0))
                .animation(Animation.easeInOut(duration: 0.5).delay(0.8).repeatForever(autoreverses: true))
                .onAppear(){ self.greentwo.toggle() }
        }
        .scaleEffect(2)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
