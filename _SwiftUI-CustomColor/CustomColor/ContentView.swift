 
import SwiftUI

extension Color {
    static let teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.darkPink, Color.teal]), startPoint: .topLeading, endPoint: .bottomTrailing)
            HStack {
                Image(systemName: "swift")
                    .foregroundColor(Color.darkPink)
                    .font(.system(size: 35))
                    .shadow(radius: 10)
                Text("Custom Color in SwiftUI")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color.teal)
            .cornerRadius(10)
            .shadow(color: Color.white, radius: 20)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
