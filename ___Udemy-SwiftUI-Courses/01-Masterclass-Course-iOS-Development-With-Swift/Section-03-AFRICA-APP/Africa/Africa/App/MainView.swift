import SwiftUI

struct MainView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
          ContentView()
            .tabItem {
              Image(systemName: "square.grid.2x2")
              Text("Browse")
            }
          
          VideoListView()
            .tabItem {
              Image(systemName: "play.rectangle")
              Text("Watch")
            }
          
          MapView()
            .tabItem {
              Image(systemName: "map")
              Text("Locations")
            }
          
          GalleryView()
            .tabItem {
              Image(systemName: "photo")
              Text("Gallery")
            }
        } //: TAB
    }
}

// MARK: PREVIEW
#if DEBUG
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .previewDevice("iPhone 12 Pro Max")
  }
}
#endif
