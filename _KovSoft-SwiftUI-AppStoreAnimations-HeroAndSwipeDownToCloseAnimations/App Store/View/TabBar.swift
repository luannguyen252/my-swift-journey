import SwiftUI

struct TabBar: View {
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("dark"))
    }
    
    var body: some View {
        ZStack {
            TabView {
                HomeScreen(animation: animation)
                    .environmentObject(detailObject)
                    .tabItem() {
                        selection == 1 ? Image(systemName: "house.fill") : Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(1)
                
                CategoryScreen()
                    .tabItem {
                        selection == 2 ? Image(systemName: "rectangle.stack.fill") : Image(systemName: "rectangle.stack")
                        Text("Category")
                    }
                    .tag(2)
                
                SavedScreen()
                    .tabItem {
                        selection == 3 ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                        Text("Saved")
                    }
                    .tag(3)
                
                HistoryScreen()
                    .tabItem {
                        selection == 4 ? Image(systemName: "clock.fill") : Image(systemName: "clock")
                        Text("History")
                    }
                    .tag(4)
                
                ProfileScreen()
                    .tabItem {
                        selection == 5 ? Image(systemName: "person.crop.circle.fill") : Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(5)
            }
            .opacity(detailObject.show ? 0 : 1)
            
            // Hiding tab bar when detail page open
            //.opacity(detailObject.show ? 0 : 1)
            if detailObject.show {
                Detail(detail: detailObject, animation: animation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
