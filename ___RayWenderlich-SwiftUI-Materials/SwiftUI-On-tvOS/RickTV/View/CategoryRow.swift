import SwiftUI

struct CategoryRow: View {
  var category: Category
  @State var showOnlyFavorites = false
  @State var customTitle: String?

  var body: some View {
    Text(customTitle ?? category.title)
      .font(.headline)
      .bold()

    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(alignment: .top) {
        ForEach(showOnlyFavorites ? category.favoriteVideos : category.videos) { video in
          NavigationLink(destination: VideoDetailView(category: category, video: video)) {
            VideoThumbnailView(video: video)
              .frame(maxWidth: 460)
              .cornerRadius(10)
              .padding()
          }
          .buttonStyle(PlainNavigationLinkButtonStyle())
        }
      }
    }
    .padding()
  }
}
