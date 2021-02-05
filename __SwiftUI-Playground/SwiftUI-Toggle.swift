import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var notificationsEnabled = true
    
    var body: some View {
        Toggle("Notifications", isOn: $notificationsEnabled)
            .padding()
            .frame(width: 375, height: 64)
            .background(Color(UIColor.quaternarySystemFill))
            .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(ContentView())