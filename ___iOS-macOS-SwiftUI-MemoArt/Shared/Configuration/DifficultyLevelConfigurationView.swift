import SwiftUI
import ComposableArchitecture

struct DifficultyLevelConfigurationView: View {
    let store: Store<ConfigurationState, ConfigurationAction>
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("A new game will use \(viewStore.difficultyLevel.cardsCount/2) pairs of cards")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                DifficultyLevelPicker(level: difficultyLevelBinding(store: viewStore))
                    .padding([.horizontal, .bottom])
            }
        }
    }

    private func difficultyLevelBinding(
        store: ViewStore<ConfigurationState, ConfigurationAction>
    ) -> Binding<DifficultyLevel> {
        store.binding(
            get: { $0.difficultyLevel },
            send: { .changeDifficultyLevel($0) }
        )
    }

    private var pickerBackgroundOpacity: Double {
        colorScheme == .light ? 20/100 : 80/100
    }
}
