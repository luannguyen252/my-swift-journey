import SwiftUI
import PermissionsSwiftUI

struct ContentView: View {
    @State var showModal = false
    
    var body: some View {
        Button(action: {
            showModal = true
        }, label: {
            Text("Ask user for permissions")
                .font(.system(size: 24))
        })
        .JMPermissions(showModal: $showModal, for: [.locationAlways, .photo, .microphone])
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
