import SwiftUI

struct ContentView: View {
    @State var rotateOuter = false
    @State var rotateInner = false
    @State var rotateOutSuper = false

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: 50)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(1.2)
        
            VStack {
                Text("Inner Outer Animation")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.white)
                
                ZStack {
                // Outer Super Layer
                Image("flowerbody") // Outer image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(rotateInner ? 180 : 0))
                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                    .onAppear() { self.rotateOutSuper.toggle() }

                // Outer Layer
                Image("flowerbodynew") // Outer image
                    .resizable()
                    .frame(width : 260 , height: 260)
                    .rotationEffect(.degrees(rotateInner ? -180 : 0))
                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                    .onAppear() { self.rotateOuter.toggle() }
                    
                // Inner Layer
                Image("flowerbase") // Inner image
                    .resizable()
                    .frame(width : 260 , height: 260)
                    .rotationEffect(.degrees(rotateInner ? 180 : 0))
                    .animation(Animation.easeOut(duration: 5 ).repeatForever(autoreverses: true))
                    .onAppear(){
                        self.rotateInner.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

