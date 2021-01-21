import SwiftUI

struct ContentView: View {
    var body: some View {
        ShapesIcons()
    }
}

struct ShapesIcons: View {
    // MARK:- Variables
    @State var triangle = false
    @State var circle = false
    @State var square = false
    @State var cross = false
   
    // MARK:- Main Code
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            
            VStack {
                Spacer()
                    .frame(width: 100, height: 100, alignment: .center)
                
                HStack {
                    VStack {
                        Image("square")
                            .resizable()
                            .frame(width: 150, height: 120, alignment: .center)
                    }
                    .rotationEffect(.degrees(square ? 360 : 0), anchor: .center)
                    .scaleEffect(square ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: true))
                    .opacity(square ? 1 : 0.5)
                    .shadow(color: .pink, radius: 5, x: 0.0, y: 0.0)
                    .onAppear() {
                        self.square.toggle()
                    }
        
                    VStack {
                        Image("triangle")
                            .resizable()
                            .frame(width: 150, height: 120, alignment: .center)
                    }
                    .rotationEffect(.degrees(triangle ? 360 : 0), anchor: .center)
                    .scaleEffect(triangle ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .opacity(triangle ? 1 : 0.5)
                    .shadow(color: .green, radius: 5, x: 0.0, y: 0.0)
                    .onAppear() {
                        self.triangle.toggle()
                    }
                }

                HStack {
                    VStack {
                        Image("cross")
                            .resizable()
                            .frame(width: 150, height: 120, alignment: .center)
                    }
                    .rotationEffect(.degrees(cross ? 360 : 0), anchor: .center)
                    .scaleEffect(cross ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).delay(3).repeatForever(autoreverses: true))
                    .opacity(cross ? 1 : 0.5)
                    .shadow(color: .blue, radius: 5, x: 0.0, y: 0.0)
                    .onAppear() {
                        self.cross.toggle()
                    }
                    
                    VStack {
                        Image("circle")
                            .resizable()
                            .frame(width: 165, height: 165, alignment: .center)
                    }
                    .rotationEffect(.degrees(circle ? 360 : 0), anchor: .center)
                    .scaleEffect(circle ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).delay(4).repeatForever(autoreverses: true))
                    .opacity(circle ? 1 : 0.5)
                    .shadow(color: .red, radius: 5, x: 0.0, y: 0.0)
                    .onAppear() {
                        self.circle.toggle()
                    }
                }
                
                Spacer()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("The App Wizard")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .opacity(0.5)
            
                Text("Playstation Icons")
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .opacity(0.5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
