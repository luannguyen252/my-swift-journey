import SwiftUI

struct ContentView: View {
    // Controls display of sidebar
    @State var showSidebar: Bool = false
    
    var body: some View {
        SideBarStack(sidebarWidth: 125, showSidebar: $showSidebar) {
            // Sidebar content here
            VStack {
                Text("Side Bar Content.")
            }
        } content: {
            // Main content here
            VStack {
                Text("Main Content.")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
