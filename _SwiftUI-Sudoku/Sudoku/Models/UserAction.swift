import SwiftUI
import Combine

final class UserAction: ObservableObject {
    enum ActionType: Equatable {
        case none
        case clear
        case digit(_ digit: Int)
    }
    @Published
    var action: ActionType = .none
}
