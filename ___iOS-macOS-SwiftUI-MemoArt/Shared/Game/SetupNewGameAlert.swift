import SwiftUI
import ComposableArchitecture

struct SetupNewGameAlert: ViewModifier {
    struct ViewState: Equatable {
        var isPresented: Bool
    }

    enum ViewAction {
        case newGame
        case hide
    }

    let store: Store<GameState, GameAction>

    func body(content: Content) -> some View {
        WithViewStore(store.scope(state: { $0.view }, action: GameAction.view)) { viewStore in
            content.background(EmptyView().alert(isPresented: viewStore.binding(get: { $0.isPresented }, send: .hide)) {
                Alert(
                    title: Text("New game"),
                    message: Text("This will reset the current game, you will loose your progress!"),
                    primaryButton: .cancel(),
                    secondaryButton: .destructive(
                        Text("Reset game"),
                        action: {
                            DispatchQueue.main.async {
                                viewStore.send(.newGame)
                            }
                        }
                    )
                )
            })
        }
    }
}

private extension GameState {
    var view: SetupNewGameAlert.ViewState {
        .init(isPresented: isNewGameAlertPresented)
    }
}

private extension GameAction {
    static func view(localAction: SetupNewGameAlert.ViewAction) -> Self {
        switch localAction {
        case .newGame: return .new
        case .hide: return .hideNewGameAlert
        }
    }
}
