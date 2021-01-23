import SwiftUI

struct ContentView: View {
    var body: some View {
        Loading()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loading : View {
    // @State used to set animation to false, default state
    @State var animation = false
    
    var body: some View {
        ZStack {
            Circle().fill(Color.green.opacity(0.25)).frame(width: 350, height: 350)
                // Create scale effect that operates on the boolean of our @State animation that will resize to 1 : 0
                .scaleEffect(self.animation ? 1 : 0)
            Circle().fill(Color.green.opacity(0.35)).frame(width: 250, height: 250)
                .scaleEffect(self.animation ? 1 : 0)
            Circle().fill(Color.green.opacity(0.45)).frame(width: 150, height: 150)
                .scaleEffect(self.animation ? 1 : 0)
            Circle().fill(Color.green).frame(width: 30, height: 30)
            // Adds an action to perform when the view appears, @State animation toggles to true, animation init
        }.onAppear {
            self.animation.toggle()
        }
        /* animation will operate as a linear type property with a duration of 1.5 seconds on a continuous loop
         autoreverse will run the animation backwards and forwards */
        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
    }
}
