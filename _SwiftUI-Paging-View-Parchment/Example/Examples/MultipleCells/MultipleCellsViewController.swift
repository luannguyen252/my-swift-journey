import UIKit
import Parchment

class MultipleCellsViewController: UIViewController {

    let items: [PagingItem] = [
        IconItem(icon: "earth", index: 0),
        PagingIndexItem(index: 1, title: "TODO"),
        PagingIndexItem(index: 2, title: "In Progress"),
        PagingIndexItem(index: 3, title: "Archive"),
        PagingIndexItem(index: 4, title: "Other")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagingViewController = PagingViewController()
        pagingViewController.register(IconPagingCell.self, for: IconItem.self)
        pagingViewController.register(PagingTitleCell.self, for: PagingIndexItem.self)
        pagingViewController.menuItemSize = .selfSizing(estimatedWidth: 100, height: 60)
        pagingViewController.dataSource = self
        pagingViewController.select(index: 0)
        
        // Add the paging view controller as a child view controller
        // and contrain it to all edges.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }


}

extension MultipleCellsViewController: PagingViewControllerDataSource {
  
  func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
    return TableViewController()
  }
  
  func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
    return items[index]
  }
  
  func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
    return items.count
  }
  
}
