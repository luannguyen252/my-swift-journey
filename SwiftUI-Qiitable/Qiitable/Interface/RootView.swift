import SwiftUI

struct RootView: View {
    @ObservedObject var presenter: RootPresenterImpl

    var body: some View {
        ZStack {
            TabBar(presenter: presenter)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(presenter: RootPresenterImpl(router: RootRouterImpl()))
    }
}
