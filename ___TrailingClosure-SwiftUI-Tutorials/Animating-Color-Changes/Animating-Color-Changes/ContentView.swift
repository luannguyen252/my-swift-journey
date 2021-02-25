import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SplashViewExample()) {
                    Text("Splash View Example")
                }

                NavigationLink(destination: SplashExample01()) {
                    Text("Splash Example 01")
                }
                
                NavigationLink(destination: SplashExample02()) {
                    Text("Splash Example 02")
                }
            }
            .navigationBarTitle("Animating Color Changes")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
