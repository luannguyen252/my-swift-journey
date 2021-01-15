import SwiftUI

struct TabBar: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var presenter: RootPresenterImpl

    var body: some View {
        TabView(selection: $appState.tabState) {
            presenter.showHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .imageScale(.large)
                        Text("home")
                    }
                }
                .tag(TabState.home)

            presenter.showSearchTopView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                        Text("search")
                    }
                }.tag(TabState.search)

            Text("random")
                .tabItem {
                    VStack {
                        Image(systemName: "pencil.and.outline")
                            .imageScale(.large)
                        Text("random")
                    }
                }.tag(TabState.random)

            Text("history")
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                            .imageScale(.large)
                        Text("history")
                    }
                }.tag(TabState.history)

            Text("mypage")
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                        Text("mypage")
                    }
                }.tag(TabState.mypage)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static let appState: AppState = .init()
    static var previews: some View {
        TabBar(presenter: RootPresenterImpl(router: RootRouterImpl()))
            .environmentObject(appState)
    }
}
