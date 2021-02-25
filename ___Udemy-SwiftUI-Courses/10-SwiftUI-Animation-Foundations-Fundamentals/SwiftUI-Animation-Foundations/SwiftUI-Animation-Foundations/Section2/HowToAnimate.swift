import SwiftUI

struct HowToAnimate: View {
    // 1. Create a State variable
    @State var rotateBell = false
    
    var body: some View {
        Image(systemName: "bell.fill")
            .font(.system(size: 120))
            // 3. Add the property (modifier) you want to animate
            // 4. Use the state variable along with ternary conditional operation to change the property you want to animate
            // 5. Add the animation modifier and set its parameters
            .rotationEffect(.degrees(rotateBell ? -45 : 45), anchor: .top)
            //.animation(Animation.spring().repeatCount(10))
            .animation(Animation.linear.repeatForever(autoreverses: true).speed(1))
            // 2. Define how you want the animation to start
            .onAppear() {
                rotateBell.toggle()
            }
    }
}

struct HowToAnimate_Previews: PreviewProvider {
    static var previews: some View {
        HowToAnimate()
    }
}
