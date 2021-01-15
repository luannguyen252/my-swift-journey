import Foundation

final class AppState: ObservableObject {
    @Published var isLogin = false
    @Published var tabState: TabState = .home
}

enum TabState: Hashable {
    case home
    case search
    case random
    case history
    case mypage
}
