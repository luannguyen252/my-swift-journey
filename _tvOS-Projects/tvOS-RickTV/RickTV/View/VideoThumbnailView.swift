import SwiftUI

struct VideoThumbnailView: View {
  var video: Video

  @Environment(\.isFocused) var isFocused: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Image(video.thumbnailName)
        .resizable()
        .renderingMode(.original)
        .aspectRatio(contentMode: .fill)
        .frame(width: 450, height: 255)
        .clipped()
        .cornerRadius(10)
        .shadow(radius: 5)
      
      VStack(alignment: .leading) {
        // Video Title
        Text(video.title)
          .foregroundColor(.primary)
          .font(.headline)
          .bold()
        // Video Description
        Text(video.description.isEmpty ? "No description provided for this video." : video.description)
          .font(.subheadline)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .frame(height: 80)
      }
    }
  }
}

#if DEBUG
struct VideoItem_Previews: PreviewProvider {
  static var previews: some View {
    VideoThumbnailView(
      video: Video(
        title: "Introduction to ARKit",
        description: "Learn about ARKit in this amazing tutorial!",
        thumbnailName: "arkit"
      )
    )
  }
}
#endif
