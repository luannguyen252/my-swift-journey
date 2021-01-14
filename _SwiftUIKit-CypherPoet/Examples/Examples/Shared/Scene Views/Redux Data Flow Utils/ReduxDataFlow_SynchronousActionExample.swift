//
// ReduxDataFlow_SynchronousActionExample.swift
// Examples
//
// Created by CypherPoet on 8/20/20.
// ✌️
//

import SwiftUI


struct ReduxDataFlow_SynchronousActionExample {
    @EnvironmentObject var store: AppStore

    let galaxyOptions: [Galaxy] = [
        .andromeda,
        .cartwheel,
        .eyeOfSauron,
    ]
}


// MARK: - `View` Body
extension ReduxDataFlow_SynchronousActionExample: View {

    var body: some View {
        VStack(spacing: 22) {
            Text("Current Galaxy: \(currentGalaxy.name)")

            Button(action: chooseRandomGalaxy) {
                Text("Choose Random Galaxy")
            }
        }
    }
}


// MARK: - Computeds
extension ReduxDataFlow_SynchronousActionExample {
    var currentGalaxy: Galaxy { store.state.galaxiesState.currentGalaxy }
}


// MARK: - View Variables
private extension ReduxDataFlow_SynchronousActionExample {
}


// MARK: - Private Helpers
private extension ReduxDataFlow_SynchronousActionExample {

    func chooseRandomGalaxy() {
        var newGalaxy: Galaxy

        repeat {
            newGalaxy = galaxyOptions.randomElement()!
        } while newGalaxy == currentGalaxy

        store.dispatch(.galaxies(.currentGalaxySet(newGalaxy)))
    }
}


#if DEBUG
// MARK: - Preview
struct ReduxDataFlow_SynchronousActionExample_Previews: PreviewProvider {

    static var previews: some View {
        ReduxDataFlow_SynchronousActionExample()
            .environmentObject(PreviewData.AppStores.initial)
    }
}
#endif
