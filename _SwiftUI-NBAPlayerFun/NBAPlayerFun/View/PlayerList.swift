import SwiftUI

struct PlayerList: View {
    var body: some View {
        // Put the list inside a Navigation View
        NavigationView {
            List(players) {
                eachPlayers in // Kind of like an argument name
                NavigationLink(destination: PlayerDetail(playerInfo: eachPlayers)) {
                    PlayerRow(player: eachPlayers)
                        .frame(height: 60)
                }
            }
            .navigationBarTitle(Text("NBA Finals Players")) // Nav bar title large by default
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // To view UI on multiple device simulations
            PlayerList().previewDevice("iPhone 11")
            PlayerList().previewDevice("iPhone 8")
            PlayerList().previewDevice("iPhone SE (2nd generation)")
        }
    }
}
