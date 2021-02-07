import SwiftUI

struct ContentView1: View {
    var body: some View {
        VStack {
            Image("avatar1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Image(systemName: "faceid")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "wifi")
                .imageScale(.large)
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .background(Color.black)
                .font(.system(size: 50))
                .padding()
            
            Image(systemName: "swift")
                .font(.system(size: 50))
                .blur(radius: 3.0)
                .foregroundColor(.red)
            
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
