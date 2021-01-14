import SwiftUI

struct CircleImage: View {
    var artist: Artist
    var body: some View {
        Image(artist.name)
        .resizable()
        .clipShape(Circle())
        .frame(width: 75.0, height: 90.0)
        .padding()
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(artist: ArtistData[0])
    }
}
