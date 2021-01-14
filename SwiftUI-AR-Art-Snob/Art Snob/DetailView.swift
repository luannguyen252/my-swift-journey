import SwiftUI

struct DetailView: View {
    var artist: Artist
    var body: some View {
        VStack {
            Text(artist.name).font(.system(size: 40))
            ScrollView(.horizontal) {
                HStack {
                    ForEach((1...10), id: \.self) { number in
                        RegularImage(name: "\(self.artist.name + "\(number)")")
                    }
                }
            }.frame(width: 400, height: 600)
        }.offset(y: -55)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artist: ArtistData[2])
    }
}
