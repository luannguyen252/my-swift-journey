import SwiftUI
import ComposableArchitecture

struct SetupHighScoresSheetView: ViewModifier {
    struct ViewState: Equatable {
        var preselectedLevel: DifficultyLevel
        var isPresented: Bool
    }

    enum ViewAction {
        case hide
    }

    let store: Store<AppState, AppAction>

    func body(content: Content) -> some View {
        WithViewStore(store.scope(state: { $0.view }, action: AppAction.view)) { viewStore in
            content.background(EmptyView().sheet(
                isPresented: viewStore.binding(get: { $0.isPresented }, send: .hide)
            ) {
                sheet(viewStore: viewStore)
            })
        }
    }

    private func sheet(viewStore: ViewStore<ViewState, ViewAction>) -> some View {
        VStack {
            Text("High Scores 🏆")
                .font(.largeTitle)
                .padding()
            HighScoresView(
                store: store.highScoresStore,
                preselectedLevel: viewStore.preselectedLevel
            )
            HStack {
                Spacer()
                Button { viewStore.send(.hide) } label: {
                    Text("Done")
                }
            }.padding()
        }
    }
}

private extension AppState {
    var view: SetupHighScoresSheetView.ViewState {
        .init(preselectedLevel: game.level, isPresented: highScores.isPresented)
    }
}
private extension AppAction {
    static func view(localAction: SetupHighScoresSheetView.ViewAction) -> Self {
        switch localAction {
        case .hide: return .highScores(.hide)
        }
    }
}
