import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .tabItem {
                    VStack {
                        Image("home")
                            .renderingMode(.template)
                        Text("Home")
                    }
                }
                .tag(0)
            
            Text("App's View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("store")
                        .renderingMode(.template)
                        Text("Apps")
                    }
                }
                .tag(1)
            
            Text("Games View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("game")
                        .renderingMode(.template)
                        Text("Juegos")
                    }
                }
                .tag(2)
            
            Text("Downloads View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("download")
                        .renderingMode(.template)
                        Text("Descargas")
                    }
                }
                .tag(3)
            
            Text("Search View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("search")
                        .renderingMode(.template)
                        Text("Buscar")
                    }
                }
                .tag(4)
        }
        .accentColor(Color(red: 254/255, green: 44/255, blue: 102/255))
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
