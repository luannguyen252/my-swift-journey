import SwiftUI
import ParallaxSwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Parallax is pretty cool!")
        }, label: {
            ZStack {
                /// Shadow
                LinearGradient(
                    gradient: Gradient(colors: [.init(red: 0, green: 0.5, blue: 1), .purple]),
                    startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .blur(radius: 18)
                )
                .blur(radius: 18)
                .opacity(0.8)
                .parallax(amount: 18)
                .frame(height: 60)
                
                /// Rectangle
                LinearGradient(
                    gradient: Gradient(colors: [.init(red: 0, green: 0.5, blue: 1), .purple]),
                    startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                )
                .frame(height: 60)
                
                /// Text
                Text("Parallax")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .shadow(radius: 5)
                    .parallax(minHorizontal: 10, maxHorizontal: -10, minVertical: 10, maxVertical: -10, direction: .both)
            }
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
