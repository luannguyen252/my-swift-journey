import Foundation

class Video: Identifiable, Equatable, ObservableObject {
  var id = UUID()
  var title: String
  var description: String
  var thumbnailName: String
  @Published var favorite = false

  init(
    title: String,
    description: String,
    thumbnailName: String
  ) {
    self.title = title
    self.description = description
    self.thumbnailName = thumbnailName
  }

  static func == (lhs: Video, rhs: Video) -> Bool {
    return lhs.id == rhs.id
  }
}
