import SwiftUI
import ComposableArchitecture

struct SetupDifficultyLevelChangedAlert: ViewModifier {
    let store: Store<AppState, AppAction>

    func body(content: Content) -> some View {
        WithViewStore(store) { viewStore in
            content.background(EmptyView().alert(isPresented: isPresented(store: viewStore)) {
                Alert(
                    title: Text("Difficulty level changed"),
                    message:
                        Text("You have just changed the difficulty level, but there is a game currently in progress")
                        + Text("\n")
                        + Text("Do you want to start a new game? You will loose your current progress then!"),
                    primaryButton: .cancel(),
                    secondaryButton: .destructive(
                        Text("New game"),
                        action: {
                            DispatchQueue.main.async {
                                viewStore.send(.game(.new))
                            }
                        }
                    )
                )
            })
        }
    }

    private func isPresented(store: ViewStore<AppState, AppAction>) -> Binding<Bool> {
        store.binding(
            get: { $0.isDifficultyLevelHasChangedPresented },
            send: { _ in .hideDifficultyLevelHasChanged }
        )
    }
}
