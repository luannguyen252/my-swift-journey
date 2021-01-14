import SwiftUI

struct GalleryView: View {
    var body: some View {
            List(ArtistData) { artist in
                NavigationLink(destination: DetailView(artist: artist)) {
                    Row(artist: artist)
                }
            }
            .navigationBarTitle(Text("Artists"))
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
