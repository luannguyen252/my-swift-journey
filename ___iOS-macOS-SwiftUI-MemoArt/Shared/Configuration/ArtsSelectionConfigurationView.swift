import SwiftUI
import ComposableArchitecture

struct ArtsSelectionConfigurationView: View {
    let store: Store<ConfigurationState, ConfigurationAction>
    let columns =  Array(repeating: GridItem(.flexible(minimum: 65, maximum: 120)), count: 4)

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("A new game will randomly display \(viewStore.cardsCount) cards among the ones you chose")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack {
                    Text("\(viewStore.selectedArts.count)")
                        .bold()
                        .foregroundColor(
                            viewStore.selectedArts.count > viewStore.cardsCount/2
                                ? .green
                                : .orange
                        )
                        + Text("/\(viewStore.cardsCount/2)")
                }
                .animation(nil)

                VStack {
                    if viewStore.selectedArts.count <= viewStore.cardsCount/2 {
                        Text("You've reached the limit.\nYou need \(viewStore.cardsCount/2) cards or more to play.")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.orange)
                            )
                            .padding([.horizontal, .top])
                    }
                }
                .animation(.spring())

                LazyVGrid(columns: columns) {
                    ForEach(Art.allCases, id: \.self) { art in
                        Button {
                            viewStore.send(
                                viewStore.selectedArts.contains(art)
                                    ? .unselectArt(art)
                                    : .selectArt(art)
                            )
                        } label: {
                            art.image
                                .resizable()
                                .modifier(AddCardStyle(foregroundColor: .black))
                                .modifier(SelectionCardStyle(
                                    isSelected: viewStore.selectedArts.contains(art)
                                ))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
                .animation(.spring())
            }
        }
    }
}

private struct SelectionCardStyle: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        content
            .overlay(isSelected ? Color.clear : Color.black.opacity(2/3))
            .overlay(isSelected ? nil : Text("❌"))
            .cornerRadius(8)
            .accessibility(label: isSelected ? Text("selected") : Text("unselected"))
    }
}

#if DEBUG
struct ArtsSelectionConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ArtsSelectionConfigurationView(store: Store(
            initialState: ConfigurationState(),
            reducer: configurationReducer,
            environment: ConfigurationEnvironment(
                mainQueue: .preview,
                save: { _ in },
                load: { ConfigurationState() }
            )
        ))
    }
}

struct ArtsSelectionConfigurationView2_Previews: PreviewProvider {
    static var previews: some View {
        ArtsSelectionConfigurationView(store: Store(
            initialState: ConfigurationState(selectedArts: .countLimit),
            reducer: configurationReducer,
            environment: ConfigurationEnvironment(
                mainQueue: .preview,
                save: { _ in },
                load: { ConfigurationState() }
            )
        ))
    }
}

extension Set where Element == Art {
    static var countLimit: Self {
        Set(Art.allCases.prefix(10))
    }
}
#endif
