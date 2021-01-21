import SwiftUI

struct PikachuView: View {
    @State var tail = false
    @State var shockOne = false
    @State var shockTwo = false
    @State var visibilityOpacity = false
    @State var titleShadow = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("title")
                    .resizable()
                    .frame(width: 400, height: 95, alignment: .center)
                    .shadow(color: .yellow, radius: titleShadow ? 10 : 0, x: 0.0, y: 0.0)
                    .animation(Animation.easeInOut(duration: 0.3).delay(1).repeatForever(autoreverses: true))
                    .onAppear() { self.titleShadow.toggle() }
                
                Text("The App Wizard")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
       
                ZStack {
                    // Tail
                    Image("image3")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
                        .rotationEffect(.degrees(9))
                        .offset(x: 80, y: 0)
                        .rotationEffect(.degrees(tail ? 0 : 35))
                        .animation(Animation.easeInOut(duration: 1).delay(5).repeatForever(autoreverses: true))
                        .onAppear() { self.tail.toggle() }
            
                    // Close Eyes
                    Image("image1")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
            
                    // Open Eyes
                    Image("image2")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                        .shadow(color: .yellow, radius: 0.5, x: 0.0, y: 0.0)
                        .opacity(visibilityOpacity ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.2).delay(2).repeatForever(autoreverses: true))
                        .onAppear() { self.visibilityOpacity.toggle() }
            
                    // Shock
                    Image("shock1")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(color: .yellow, radius: 2, x: 0.0, y: 0.0)
                        .opacity(shockOne ? 1 : 0)
                        .clipShape(Circle().offset(x: shockOne ? 0 : 125))
                        .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(5).repeatForever(autoreverses: true).delay(1))
                        .onAppear() { self.shockOne.toggle() }
            
                    Image("shock2")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(color: .yellow, radius: 2, x: 0.0, y: 0.0)
                        .opacity(shockTwo ? 1 : 0)
                        .clipShape(Circle().offset(x: shockTwo ? 0 : -125))
                        .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(5).repeatForever(autoreverses: true).delay(1))
                        .onAppear() { self.shockTwo.toggle() }
                }
            }
        }
    }
}

struct PikachuView_Previews: PreviewProvider {
    static var previews: some View {
        PikachuView()
    }
}
