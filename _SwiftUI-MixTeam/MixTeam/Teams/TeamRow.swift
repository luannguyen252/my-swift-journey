import SwiftUI

struct TeamRow: View {
    let team: Team
    let callbacks: Callbacks

    var body: some View {
        VStack {
            sectionHeader
                .font(.callout)
                .foregroundColor(Color.white)
                .padding(.top)
            VStack {
                ForEach(team.players) { player in
                    PlayerRow(
                        player: player,
                        isInFirstTeam: false,
                        callbacks: self.playerRowCallbacks
                    )
                }
            }.padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(team.colorIdentifier.color)
        .modifier(AddDashedCardStyle())
        .modifier(AddSoftRemoveButton(remove: delete))
        .padding()
    }

    private var sectionHeader: some View {
        Button(action: edit) {
            VStack {
                Text(team.name).padding([.leading, .trailing])
                team.imageIdentifier.image
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(team.colorIdentifier.color)
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(Color.white.clipShape(Splash2()))
                    .padding(.bottom)
            }
        }
        .accessibility(label: Text("Edit Team \(team.name)"))
    }
}

extension TeamRow {
    struct Callbacks {
        let editTeam: (Team) -> Void
        let deleteTeam: (Team) -> Void
        let editPlayer: (Player) -> Void
        let moveBackPlayer: (Player) -> Void
    }

    private var playerRowCallbacks: PlayerRow.Callbacks {
        .init(
            edit: callbacks.editPlayer,
            delete: { _ in },
            moveBack: callbacks.moveBackPlayer
        )
    }

    private func edit() { callbacks.editTeam(team) }
    private func delete() { callbacks.deleteTeam(team) }
}

#if DEBUG
struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    private struct Preview: View, TeamRowPreview {
        var body: some View {
            Group {
                TeamRow(
                    team: Team(
                        id: UUID(),
                        name: "Team Test",
                        colorIdentifier: .red,
                        imageIdentifier: .koala,
                        players: []
                    ),
                    callbacks: debuggableCallbacks
                )
                TeamRow(
                    team: Team(
                        id: UUID(),
                        name: "Team Test with Players",
                        colorIdentifier: .blue,
                        imageIdentifier: .octopus,
                        players: [
                            Player(name: "Player 1", imageIdentifier: .girl),
                            Player(name: "Player 2", imageIdentifier: .santa),
                        ]
                    ),
                    callbacks: debuggableCallbacks
                )
                FirstTeamRow(
                    team: Team(
                        id: UUID(),
                        name: "Players standing for a Team",
                        colorIdentifier: .gray,
                        imageIdentifier: .unknown,
                        players: [
                            Player(name: "Player 1", imageIdentifier: .girl),
                        ]
                    ),
                    callbacks: firstTeamDebuggableCallbacks
                )
            }
        }
    }
}

struct TeamRowUX_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    private struct Preview: View, TeamRowPreview {
        @State private var teams: [Team] = [.test]

        var body: some View {
            ScrollView {
                ForEach(teams, content: teamRow)
                Button(action: addTeam) {
                    Text("Add Team")
                }
            }.animation(.default)
        }

        private func teamRow(_ team: Team) -> some View {
            TeamRow(team: team, callbacks: callbacks)
                .transition(.move(edge: .leading))
        }

        private func addTeam() {
            teams.append(
                Team(
                    id: UUID(),
                    name: "Team Test",
                    colorIdentifier: ColorIdentifier.allCases.randomElement() ?? .red,
                    imageIdentifier: ImageIdentifier.teams.randomElement() ?? .koala,
                    players: []
                )
            )
        }

        private var callbacks: TeamRow.Callbacks {
            .init(
                editTeam: debuggableCallbacks.editTeam,
                deleteTeam: deleteTeam,
                editPlayer: debuggableCallbacks.editPlayer,
                moveBackPlayer: debuggableCallbacks.moveBackPlayer
            )
        }

        private func deleteTeam(_ team: Team) {
            guard let index = teams.firstIndex(of: team) else { return }
            teams.remove(at: index)
        }
    }
}
#endif
