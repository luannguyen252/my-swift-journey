import Foundation

class CategoryProvider: ObservableObject {
  @Published var categories: [Category] = []
  var currentContext: ProviderContext = .general
  var dataProvider: DataProvider

  init(dataProvider: DataProvider) {
    self.dataProvider = dataProvider
  }

  enum ProviderContext: Equatable {
    case general, favorites, lotsOfVideos

    var formattedName: String {
      switch self {
      case .general: return "All Videos"
      case .favorites: return "Favorites"
      case .lotsOfVideos: return "Lots of Videos"
      }
    }

    var missingCategoriesTitle: String {
      if self == .general || self == .lotsOfVideos {
        return "Couldn't find any videos..."
      } else {
        return "No Favorite Videos"
      }
    }

    var missingCategoriesDescription: String {
      if self == .general || self == .lotsOfVideos {
        return "No videos or categories were loaded. Has something gone wrong?"
      } else {
        return "You haven't favorited any videos."
      }
    }
  }

  public func refresh() {
    switch currentContext {
    case .general:
      categories = dataProvider.categories
    case .lotsOfVideos:
      categories = dataProvider.massiveCategoryList
    case .favorites:
      categories = dataProvider.categoriesWithFavoriteVideos
    }
  }
}
