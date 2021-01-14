//
// ReduxDataFlow_AsyncSideEffectExample.swift
// Examples
//
// Created by CypherPoet on 8/20/20.
// ✌️
//

import SwiftUI


struct ReduxDataFlow_AsyncSideEffectExample {
    @EnvironmentObject var store: AppStore

    var galaxyFetchingError: Binding<GalaxiesState.MiddlewareError?> {
        store.binding(for: \.galaxiesState.galaxyFetchingError) { _ in
            .galaxies(.fetchingErrorDismissed)
        }
    }
}


// MARK: - `View` Body
extension ReduxDataFlow_AsyncSideEffectExample: View {

    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Text("Known Galaxies")
                    .font(.custom("Futura", size: 24, relativeTo: .title))

                galaxiesListView
            }
            .padding(.horizontal)

            Spacer()

            VStack(spacing: 20) {
                if galaxyFetchingState == .inProgress {
                    ProgressView()
                }

                Button(action: fetchNewGalaxies) {
                    Text("Fetch New Galaxies")
                }
            }
        }
        .padding()
        .navigationTitle("Async Side Effects")
        .alert(item: galaxyFetchingError, content: makeGalaxyFetchingAlert)
    }
}


// MARK: - Computeds
extension ReduxDataFlow_AsyncSideEffectExample {
    var galaxiesState: GalaxiesState { store.state.galaxiesState }

    var galaxyFetchingState: GalaxiesState.GalaxyFetchingState {
        galaxiesState.galaxyFetchingState
    }
}


// MARK: - View Variables
private extension ReduxDataFlow_AsyncSideEffectExample {

    @ViewBuilder var galaxiesListView: some View {
        if (galaxiesState.knownGalaxies.isEmpty) {
            Text("No galaxies found.")
        } else {
            LazyVStack(alignment: .leading) {
                ForEach(galaxiesState.knownGalaxies) { galaxy in
                    Text("-  ") + Text(galaxy.name)
                }
            }
        }
    }
}

// MARK: - Private Helpers
private extension ReduxDataFlow_AsyncSideEffectExample {

    func fetchNewGalaxies() {
        store.send(sideEffect: .galaxies(.findNewGalaxies))
    }

    func makeGalaxyFetchingAlert(_ error: GalaxiesState.MiddlewareError) -> Alert {
        Alert(
            title: Text("Galactic Failure"),
            message: Text(error.localizedDescription),
            dismissButton: .default(Text("OK"))
        )
    }
}


#if DEBUG
// MARK: - Preview
struct ReduxDataFlow_AsyncSideEffectExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReduxDataFlow_AsyncSideEffectExample()
                .environmentObject(PreviewData.AppStores.initial)
        }
    }
}
#endif
