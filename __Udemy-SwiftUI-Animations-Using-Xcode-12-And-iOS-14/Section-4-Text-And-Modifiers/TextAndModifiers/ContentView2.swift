import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            Text("SwiftUI. Build Apps. Less Code.")
            
            Divider()
            
            Spacer()
            
            Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.")
                .padding(EdgeInsets(top: 100, leading: 10, bottom: 100, trailing: 10))
                .overlay(Text("SwiftUI Overlay"), alignment: .bottom)
                .overlay(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).opacity(0.1))
                .border(Color.blue, width: 1)
            
            Spacer()
            
            Text("SwiftUI. Build Apps. Less Code.")
                .foregroundColor(.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            
            Spacer()
            
            Text("SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Image("thumb6").resizable().frame(width: 200, height: 150))
                .padding(16)
            
            Spacer()
            
            Text("SwiftUI")
                .font(.largeTitle)
//                .foregroundColor(.black)
                .foregroundColor(.white)
//                .background(Image("thumb6").resizable().frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
                .padding(16)
//                .background(Color.init(red: 0, green: 10, blue: 10))
                .background(RoundedRectangle(cornerRadius: 16))
            
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
