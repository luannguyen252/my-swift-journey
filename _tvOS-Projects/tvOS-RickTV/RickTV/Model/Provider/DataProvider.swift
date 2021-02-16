import Foundation

class DataProvider: ObservableObject {
  @Published var categories: [Category] = []

  /// Compute new categories that only contain favorited videos. Based on the `categories` object.
  var categoriesWithFavoriteVideos: [Category] {
    return categories.filter { category in
      return !category.favoriteVideos.isEmpty
    }
  }

  var massiveCategoryList: [Category] {
    var categories: [Category] = []
    for _ in 0..<100 {
      categories.append(contentsOf: self.categories)
    }
    return categories
  }

  init() {
    categories = [
      Category(title: "SwiftUI", videos: [
        Video(
          title: "SwiftUI",
          description: "",
          thumbnailName: "swiftui"
        )
      ]),
      Category(title: "UIKit", videos: [
        Video(
          title: "Demystifying Views in iOS",
          description: "",
          thumbnailName: "views"
        ),
        Video(
          title: "Reproducing Popular iOS Controls",
          description: "",
          thumbnailName: "controls"
        )
      ]),
      Category(title: "Frameworks", videos: [
        Video(
          title: "Fastlane for iOS",
          description: "",
          thumbnailName: "fastlane"
        ),
        Video(
          title: "Beginning RxSwift",
          description: "",
          thumbnailName: "rxswift"
        )
      ]),
      Category(title: "Miscellaneous", videos: [
        Video(
          title: "Data Structures & Algorithms in Swift",
          description: "",
          thumbnailName: "datastructures"
        ),
        Video(
          title: "Beginning ARKit",
          description: "Learn about ARKit in this amazing tutorial!",
          thumbnailName: "arkit"
        ),

        Video(
          title: "Machine Learning in iOS",
          description: "",
          thumbnailName: "machinelearning"
        ),
        Video(
          title: "Push Notifications",
          description: "",
          thumbnailName: "notifications"
        )
      ])
    ]
  }
}
