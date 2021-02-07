import SwiftUI
import Combine
import UIKit

struct EditPlayerView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var player: Player
    let team: Team

    var body: some View {
        VStack {
            playerNameField
            ImagePicker(team: team, selection: $player.imageIdentifier, type: .player)
        }
        .background(team.colorIdentifier.color.edgesIgnoringSafeArea(.all))
    }

    private var title: some View {
        Text(player.name)
            .font(.largeTitle)
            .padding()
    }

    private var playerNameField: some View {
        HStack {
            TextField("Edit", text: $player.name)
                .foregroundColor(Color.white)
                .font(.title)
                .padding()
                .background(team.colorIdentifier.color)
                .modifier(AddDashedCardStyle())
                .padding(.leading)
            doneButton.padding(.trailing)
        }.padding(.top)
    }

    private var doneButton: some View {
        Button(action: { self.presentation.wrappedValue.dismiss() }, label: {
            Image(systemName: "checkmark")
                .foregroundColor(team.colorIdentifier.color)
                .padding()
                .background(Splash2())
                .foregroundColor(.white)
        }).accessibility(label: Text("Done"))
    }
}

struct EditPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    struct Preview: View {
        @State private var player = Player(name: "Amelia", imageIdentifier: .girl)
        let team = Team(name: "Green Koala", colorIdentifier: .green, imageIdentifier: .koala)

        var body: some View {
            EditPlayerView(player: $player, team: team)
        }
    }
}

struct EditPlayerViewInteractive_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .environmentObject(TeamsStore())
    }

    struct Preview: View, TeamRowPreview {
        @EnvironmentObject var teamsStore: TeamsStore
        @State private var editedPlayer: Player?
        var team: Team { teamsStore.teams[1] }

        var body: some View {
            TeamRow(team: team, callbacks: teamRowCallbacks)
                .sheet(item: $editedPlayer) { player in
                    EditPlayerView(
                        player: self.$teamsStore.teams[1].players[0],
                        team: self.team
                    )
            }
        }

        private var teamRowCallbacks: TeamRow.Callbacks {
            .init(
                editTeam: debuggableCallbacks.editTeam,
                deleteTeam: debuggableCallbacks.deleteTeam,
                editPlayer: { self.editedPlayer = $0 },
                moveBackPlayer: debuggableCallbacks.moveBackPlayer
            )
        }
    }
}
