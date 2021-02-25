import SwiftUI

struct TabBar: View {
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("dark"))
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeScreen()
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
    }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewLayout(.sizeThatFits)
    }
}
#endif
