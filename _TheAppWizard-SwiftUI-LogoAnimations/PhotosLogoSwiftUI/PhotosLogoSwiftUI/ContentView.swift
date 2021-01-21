import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
            // Logo With Animation
            LogoView()
            
            Spacer()
                .frame(height: 100)
            
            Text("The App Wizard")
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .opacity(0.4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



















