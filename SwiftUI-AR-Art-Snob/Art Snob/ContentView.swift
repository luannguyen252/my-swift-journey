import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationView {
                OnboardingView()
                .navigationBarTitle("")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
