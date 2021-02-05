import ComposableArchitecture

struct ConfigurationState: Equatable, Codable {
    var selectedArts: Set<Art> = Set(Art.allCases)
    var difficultyLevel: DifficultyLevel = .normal
    var cardsCount: Int { difficultyLevel.cardsCount }
    var isPresented = false

    var persist: Self {
        ConfigurationState(selectedArts: selectedArts, difficultyLevel: difficultyLevel)
    }
}

enum ConfigurationAction: Equatable {
    case unselectArt(Art)
    case selectArt(Art)
    case save
    case load
    case changeDifficultyLevel(DifficultyLevel)
    case present
    case hide
}

struct ConfigurationEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var save: (ConfigurationState) -> Void
    var load: () -> ConfigurationState
}

private let saveDebounceId = "Configuration Save Debounce"

let configurationReducer = Reducer<
    ConfigurationState,
    ConfigurationAction,
    ConfigurationEnvironment
> { state, action, environment in
    switch action {
    case let .unselectArt(art):
        guard state.selectedArts.count > state.difficultyLevel.cardsCount/2 else { return .none }

        state.selectedArts = state.selectedArts.filter({ $0 != art })
        return Effect(value: .save)
            .debounce(id: saveDebounceId, for: .seconds(2), scheduler: environment.mainQueue)
            .eraseToEffect()
    case let .selectArt(art):
        state.selectedArts.insert(art)
        return Effect(value: .save)
            .debounce(id: saveDebounceId, for: .seconds(2), scheduler: environment.mainQueue)
            .eraseToEffect()
    case .save:
        environment.save(state.persist)
        return .none
    case .load:
        state = environment.load()
        return .none
    case let .changeDifficultyLevel(difficultyLevel):
        state.difficultyLevel = difficultyLevel

        // Check if the number of selected arts are sufficient for the new selected difficulty level
        if state.selectedArts.count < difficultyLevel.cardsCount/2 {
            Art.allCases.forEach {
                if state.selectedArts.count >= difficultyLevel.cardsCount/2 { return }

                state.selectedArts.insert($0)
            }
        }

        return Effect(value: .save)
    case .present:
        state.isPresented = true
        return .none
    case .hide:
        state.isPresented = false
        return .none
    }
}
