import SwiftUI

let numOfCircles = 12

struct BreathView: View {
    @State var moveIn = false
    @State var scaleIn = false
    @State var rotateIn = false
    
    let perDegree = 2 * CGFloat.pi / CGFloat(numOfCircles)
    let radius: CGFloat

    var body: some View {
        ZStack {
            Group {
                ForEach(0..<numOfCircles) { index in
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: UnitPoint(x: cos(CGFloat(index) * self.perDegree), y: sin(CGFloat(index) * self.perDegree)), endPoint: UnitPoint(x: 0, y: 0)))
                        //.scaleEffect(self.scaleIn ? 1 : 1)
                        .opacity(0.1)
                        .offset(x: self.moveIn ? self.radius * cos(CGFloat(index) * self.perDegree) : 0, y: self.moveIn ? self.radius * sin(CGFloat(index) * self.perDegree) : 0)
                        .frame(width: 100, height: 100)
                    
                }
            }
            .scaleEffect(scaleIn ? 1 : 0.25)
        }
        .rotationEffect(.degrees(rotateIn ? 90 : 0))
        .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
        .onAppear() {
            self.rotateIn.toggle()
            self.scaleIn.toggle()
            self.moveIn.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BreathView_Previews: PreviewProvider {
    static var previews: some View {
        BreathView(radius: 55)
            .environment(\.colorScheme, .dark)
    }
}
