import SwiftUI

struct TabViewBasic: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Hello")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Tab1")
                }
                .tag(0)
            
            Text("World")
                .tabItem {
                    // No Tab Icon
                    Text("Tab2")
                }
                .tag(1)
        }
    }
}

struct TabViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBasic()
    }
}
