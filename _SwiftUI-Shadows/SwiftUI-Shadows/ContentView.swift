import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("App of the day")
                .font(.title).bold()
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300, height: 400)
        .background(Color("pink2"))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color("pink2").opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
