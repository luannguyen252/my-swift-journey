import SwiftUI

let appleSite = "https://apple.com"

struct ContentView3: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
                .font(.callout)
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .background(Circle())
                .padding(24)
            
            Text("SwiftUI. Build Apps. Less Code")
                .bold()
                .fontWeight(.medium)
                .foregroundColor(.red)
                .font(.largeTitle)
                .shadow(color: .black, radius: 1, x: 10, y: 2)
            
            Text(appleSite)
                .underline(color: Color.black)
                .font(.system(size: 24, weight: .medium, design: .default))
                .onTapGesture {
                    print("Go to Apple site.")
                }
            
            Text("SwiftUI")
                .font(.largeTitle)
                .background(Rectangle().fill(Color.orange))
                .frame(width: 300, height: 300)
                .clipped()
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
