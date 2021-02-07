import SwiftUI
import Combine

protocol PlayersLogic {
    var teamsStore: TeamsStore { get }

    func createRandomPlayer()
    func delete(player: Player)
    func moveBack(player: Player)
}

extension PlayersLogic {
    func createRandomPlayer() {
        guard teamsStore.teams.first != nil else { return }
        let name = Player.placeholders.randomElement() ?? ""
        let image = ImageIdentifier.players.randomElement() ?? .unknown
        let player = Player(name: name, imageIdentifier: image)
        teamsStore.teams[0].players.append(player)
    }

    private func indexes(for player: Player) -> (teamIndex: Int, playerIndex: Int)? {
        guard let teamIndex = teamsStore.teams.firstIndex(where: { $0.players.contains(player) }),
            let playerIndex = teamsStore.teams[teamIndex].players.firstIndex(of: player) else {
                return nil
        }
        return (teamIndex, playerIndex)
    }

    func delete(player: Player) {
        guard let (teamIndex, playerIndex) = indexes(for: player) else {
            return
        }
        teamsStore.teams[teamIndex].players.remove(at: playerIndex)
    }

    func moveBack(player: Player) {
        guard teamsStore.teams.first != nil else { return }
        delete(player: player)
        teamsStore.teams[0].players.append(player)
    }
}

extension Player {
    static let placeholders = ["Mathilde", "Renaud", "John", "Alice", "Bob", "CJ"]
}
