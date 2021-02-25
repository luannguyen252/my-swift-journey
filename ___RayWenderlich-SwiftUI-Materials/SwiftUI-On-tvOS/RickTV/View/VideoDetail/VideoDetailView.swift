import SwiftUI

struct VideoDetailView: View {
  @State var category: Category
  @ObservedObject var video: Video

  private var categoryWithCurrentVideoRemoved: Category {
    // Make a copy of the original category to not modify the original
    return Category(
      title: category.title,
      videos: category.videos.filter { filteredVideo in
        return filteredVideo != video
      }
    )
  }

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      HStack(alignment: .top, spacing: 40) {
        VStack(alignment: .leading) {
          Image(video.thumbnailName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width: 675, height: 382)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
          Text(video.title)
            .font(Font.title3)
            .bold()
          Text(video.description.isEmpty ? "No description provided for this video." : video.description)
            .foregroundColor(Color.secondary)
            .font(Font.headline)

          Divider()

          HStack(spacing: 40) {
            NavigationLink(destination: PlayerView()) {
              Image(systemName: "play.fill")
            }

            Button {
              video.favorite.toggle()
            } label: {
              Image(systemName: video.favorite ? "heart.fill" : "heart")
            }
          }
          .padding(.bottom, 50)

          if !categoryWithCurrentVideoRemoved.videos.isEmpty {
            CategoryRow(
              category: categoryWithCurrentVideoRemoved,
              customTitle: "Related Videos"
            )
          }
        }
        .padding()
      }
    }
  }
}
