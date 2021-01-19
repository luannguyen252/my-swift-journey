import UIKit
import Parchment

final class SelfSizingViewController: PagingViewController {
  private let movies = [
    "Pulp Fiction",
    "The Shawshank Redemption",
    "The Dark Knight",
    "Fight Club",
    "Se7en",
    "Saving Private Ryan",
    "Interstellar",
    "Harakiri",
    "Psycho",
    "The Intouchables",
    "Once Upon a Time in the West",
    "Alien"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    menuItemSize = .selfSizing(estimatedWidth: 100, height: 40)
  }
}

extension SelfSizingViewController: PagingViewControllerDataSource {
  func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
    return PagingIndexItem(index: index, title: movies[index])
  }
  
  func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
    return ContentViewController(title: movies[index])
  }
  
  func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
    return movies.count
  }
}
