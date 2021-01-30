import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Color("dark")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color("purple"))
                        .frame(width: 300, height: 450)
                        .cornerRadius(24)
                        .shadow(color: Color("purple").opacity(0.1), radius: 56, x: 0, y: 20)
                        .offset(x: show ? -20 : 0)
                        .rotation3DEffect(Angle(degrees: show ? 0 : 10), axis: (x: 0, y: 10, z: 0))
                        .animation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0).delay(0.1))

                    Rectangle()
                        .fill(Color("red"))
                        .frame(width: 300, height: 450)
                        .cornerRadius(24)
                        .shadow(color: Color("red").opacity(0.1), radius: show ? 100 : 56, x: 0, y: show ? 100 : 32)
                        .offset(x: show ? -300 : 0)
                        .rotationEffect(Angle(degrees: show ? 10 : 0))
                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
                }
                .onTapGesture {
                    self.show.toggle()
                }

                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
