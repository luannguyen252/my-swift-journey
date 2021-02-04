import SwiftUI

struct PlayerDetail: View {
    var playerInfo: Player
    
    var body: some View {
        // Image("gs").resizable().frame(height: 300.0) // image can be resized
        VStack { // vertical stack to fit more than one thing.
            Image("\(playerInfo.team.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Make image round, and white background color to image/foreground, add circle overlay to image, linewidth , move up and add shadow.
            Image(playerInfo.imageName)
                .clipShape(Circle())
                .background(Circle().foregroundColor(playerInfo.team.color))
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .offset(x: 0, y: -90).shadow(radius: 15 )
            
            // Add font size and weight to Text, and padding for top of image
            Text(playerInfo.name)
                .font(.system(size: 50, weight: .heavy, design: .default))
                .padding([.top, .leading, .trailing], 5.0)
                .lineLimit(1)
                .minimumScaleFactor(0.45)
            
            ReusableStatText(statName: "Age", statValue: "\(playerInfo.age)")
            ReusableStatText(statName: "Height", statValue: playerInfo.height)
            ReusableStatText(statName: "Weight", statValue: "\(playerInfo.weight)lbs")
            
            // Spacer is to add flexible space
            Spacer()
        }
        .edgesIgnoringSafeArea(.top) // to get rid of the empty space on top of image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        Group{
        PlayerDetail(playerInfo: players[2]).previewDevice("iPhone 11")
        //            PlayerDetail(playerInfo: players[2]).previewDevice("iPhone 11 Max Pro")
        //            PlayerDetail(playerInfo: players[2]).previewDevice("iPhone SE (2nd generation)")
        //        }
    }
}
