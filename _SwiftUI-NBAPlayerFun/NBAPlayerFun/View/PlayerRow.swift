import SwiftUI

struct PlayerRow: View {
//    var foregroundColor: Color  // totonto.color or goldenState
    var player: Player
    var spacing: CGFloat = 1.5
//    var firstName: String
//    var lastName: String
    
    var body: some View {
        HStack {
            Image(player.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle()).background(Circle().foregroundColor(player.team.color).overlay(Circle().stroke(Color.white, lineWidth: 1)).shadow(radius: 3))
                .padding(.leading, spacing)
            
            // Pending changes to FN and LN
            ReusableNameText(name: player.name )
                .padding(.leading, spacing)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Spacer()
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        // PlayerRow(player: players[1]).previewLayout(.sizeThatFits) // Image fits to max and remaining space for word
        PlayerRow(player: players[1]).previewLayout(.fixed(width: 500, height: 100))
    }
}
