import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Text("The App Wizard")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(Color.white)
            
          Home()
        }
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
