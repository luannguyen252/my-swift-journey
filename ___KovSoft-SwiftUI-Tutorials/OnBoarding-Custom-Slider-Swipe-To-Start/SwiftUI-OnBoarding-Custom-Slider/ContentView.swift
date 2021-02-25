import SwiftUI

struct ContentView: View {
    @State var goToHome = false
    
    var body: some View {
        ZStack {
            if goToHome {
                TabBar()
            } else {
                OnboardScreen()
            }
        }
        .statusBar(hidden: true)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("Success")), perform: { _ in
            withAnimation {
                self.goToHome = true
            }
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
