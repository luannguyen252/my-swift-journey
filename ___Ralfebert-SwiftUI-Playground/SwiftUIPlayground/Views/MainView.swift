// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct MainView: View {

    @State var currentTab = Tab.widgets

    enum Tab {
        case widgets
        case landmarks
    }

    var body: some View {
        TabView(selection: $currentTab) {
            AllWidgetsView().tabItem {
                VStack {
                    Image(systemName: "rectangle.grid.3x2")
                    Text("Widgets")
                }
            }.tag(Tab.widgets)
            CategoryHome()
                .environmentObject(UserData())
                .tabItem {
                    VStack {
                        Image(systemName: "location.north")
                        Text("Landmarks")
                    }
                }.tag(Tab.landmarks)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
