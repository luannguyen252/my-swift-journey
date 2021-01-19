import UIKit
import Parchment

// First thing we need to do is create our own PagingItem that will
// hold our date. We need to make sure it conforms to Hashable and
// Comparable, as that is required by PagingViewController. We also
// cache the formatted date strings for performance.
struct CalendarItem: PagingItem, Hashable, Comparable {
  let date: Date
  let dateText: String
  let weekdayText: String
  
  init(date: Date) {
    self.date = date
    self.dateText = DateFormatters.dateFormatter.string(from: date)
    self.weekdayText = DateFormatters.weekdayFormatter.string(from: date)
  }
  
  static func < (lhs: CalendarItem, rhs: CalendarItem) -> Bool {
    return lhs.date < rhs.date
  }
}

class CalendarViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let pagingViewController = PagingViewController()
    pagingViewController.register(CalendarPagingCell.self, for: CalendarItem.self)
    pagingViewController.menuItemSize = .fixed(width: 48, height: 58)
    pagingViewController.textColor = UIColor.gray
    
    // Add the paging view controller as a child view
    // controller and constrain it to all edges
    addChild(pagingViewController)
    view.addSubview(pagingViewController.view)
    view.constrainToEdges(pagingViewController.view)
    pagingViewController.didMove(toParent: self)
    
    // Set our custom data source
    pagingViewController.infiniteDataSource = self
    
    // Set the current date as the selected paging item
    pagingViewController.select(pagingItem: CalendarItem(date: Date()))
  }
  
}

// We need to conform to PagingViewControllerDataSource in order to
// implement our custom data source. We set the initial item to be the
// current date, and every time pagingItemBeforePagingItem: or
// pagingItemAfterPagingItem: is called, we either subtract or append
// the time interval equal to one day. This means our paging view
// controller will show one menu item for each day.
extension CalendarViewController: PagingViewControllerInfiniteDataSource {
  
  func pagingViewController(_: PagingViewController, itemAfter pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! CalendarItem
    return CalendarItem(date: calendarItem.date.addingTimeInterval(86400))
  }
  
  func pagingViewController(_: PagingViewController, itemBefore pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! CalendarItem
    return CalendarItem(date: calendarItem.date.addingTimeInterval(-86400))
  }
  
  func pagingViewController(_: PagingViewController, viewControllerFor pagingItem: PagingItem) -> UIViewController {
    let calendarItem = pagingItem as! CalendarItem
    let formattedDate = DateFormatters.shortDateFormatter.string(from: calendarItem.date)
    return ContentViewController(title: formattedDate)
  }
  
}
