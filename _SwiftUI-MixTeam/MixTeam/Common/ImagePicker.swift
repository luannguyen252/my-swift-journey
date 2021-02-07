import SwiftUI

struct ImagePicker: View {
    let team: Team
    @Binding var selection: ImageIdentifier
    let type: ImagePickerType

    let columns = [GridItem(.adaptive(minimum: 120))]

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(images) {
                    Cell(imageIdentifier: $0, team: team, selection: $selection)
                }
            }.padding()
        }
        .background(team.colorIdentifier.color)
        .modifier(AddDashedCardStyle())
        .padding()
    }

    private var images: [ImageIdentifier] {
        switch type {
        case .team: return ImageIdentifier.teams
        case .player: return ImageIdentifier.players
        }
    }
}

private struct Cell: View {
    let imageIdentifier: ImageIdentifier
    let team: Team
    @Binding var selection: ImageIdentifier

    var body: some View {
        Button(action: select) {
            imageIdentifier.image
                .resizable()
                .renderingMode(.template)
                .frame(width: 100, height: 100)
                .padding()
                .foregroundColor(imageForegroundColor)
        }
        .background(background)
        .foregroundColor(Color.white)
    }

    private func select() {
        selection = imageIdentifier
    }

    private var imageForegroundColor: Color {
        if selection == imageIdentifier {
            return team.colorIdentifier.color
        } else {
            return .white
        }

    }

    private var background: some View {
        Group {
            if selection == imageIdentifier {
                Splash2()
            }
        }
    }
}

extension ImagePicker {
    enum ImagePickerType {
        case team, player
    }
}

#if DEBUG
struct PlayerImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .environmentObject(TeamsStore())
    }

    struct Preview: View, TeamRowPreview {
        @EnvironmentObject var teamsStore: TeamsStore
        var selection: Binding<ImageIdentifier> {
            $teamsStore.teams[1].players[0].imageIdentifier
        }

        var body: some View {
            VStack {
                ImagePicker(
                    team: teamsStore.teams[1],
                    selection: $teamsStore.teams[1].players[0].imageIdentifier,
                    type: .player
                )
                Spacer()
                TeamRow(team: teamsStore.teams[1], callbacks: debuggableCallbacks)
                Text("Selection: \(teamsStore.teams[1].players[0].imageIdentifier.rawValue)")
            }
        }
    }
}
#endif
