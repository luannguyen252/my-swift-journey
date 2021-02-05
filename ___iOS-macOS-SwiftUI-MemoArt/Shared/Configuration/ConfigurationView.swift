import SwiftUI
import ComposableArchitecture

struct ConfigurationView: View {
    let store: Store<ConfigurationState, ConfigurationAction>

    var body: some View {
        ScrollView {
            Text("Choose a difficulty level")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            DifficultyLevelConfigurationView(store: store)
            Divider()

            Text("Choose the cards you want to play with")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            ArtsSelectionConfigurationView(store: store)
            Divider()
        }
        .navigationTitle("Configuration")
        .accessibility(identifier: "configuration")
    }
}
