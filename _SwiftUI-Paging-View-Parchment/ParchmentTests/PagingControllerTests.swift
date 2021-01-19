import Foundation
import XCTest
@testable import Parchment

final class PagingControllerTests: XCTestCase {
  static let ItemSize: CGFloat = 50
  
  var options: PagingOptions!
  var collectionView: MockCollectionView!
  var collectionViewLayout: MockCollectionViewLayout!
  var dataSource: MockPagingControllerDataSource!
  var delegate: MockPagingControllerDelegate!
  var sizeDelegate: MockPagingControllerSizeDelegate?
  var pagingController: PagingController!
  
  override func setUp() {
    options = PagingOptions()
    options.selectedScrollPosition = .left
    options.menuItemSize = .fixed(
      width: PagingControllerTests.ItemSize,
      height: PagingControllerTests.ItemSize
    )
    
    collectionViewLayout = MockCollectionViewLayout()
    collectionView = MockCollectionView()
    collectionView.superview = UIView(frame: .zero)
    collectionView.collectionViewLayout = collectionViewLayout
    collectionView.window = UIWindow(frame: .zero)
    collectionView.bounds = CGRect(
      origin: .zero,
      size: CGSize(
        width: PagingControllerTests.ItemSize * 2,
        height: PagingControllerTests.ItemSize
      )
    )
    collectionView.visibleItems = {
      return self.pagingController.visibleItems.items.count
    }
    
    dataSource = MockPagingControllerDataSource()
    delegate = MockPagingControllerDelegate()
    
    pagingController = PagingController(options: options)
    pagingController.collectionView = collectionView
    pagingController.collectionViewLayout = collectionViewLayout
    pagingController.dataSource = dataSource
    pagingController.delegate = delegate
  }
  
  // MARK: - Content scrolled
  
  func testContentScrolledFromSelectedProgressPositive() {
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.5)
    
    // Expect to enter the .scrolling state and update the content offset
    XCTAssertEqual(pagingController.state, PagingState.scrolling(
      pagingItem: Item(index: 3),
      upcomingPagingItem: Item(index: 4),
      progress: 0.5,
      initialContentOffset: CGPoint(x: 100, y: 0),
      distance: PagingControllerTests.ItemSize
    ))
    
    // Combine the method calls for the collection view and
    // collection view layout to ensure that they were called in
    // the correct order.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionView(.setContentOffset(
        contentOffset: CGPoint(x: 125, y: 0),
        animated: false
      )),
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  func testContentScrolledFromSelectedProgressNegative() {
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: -0.1)
    
    // Expect to enter the .scrolling state and update the content offset
    XCTAssertEqual(pagingController.state, PagingState.scrolling(
      pagingItem: Item(index: 3),
      upcomingPagingItem: Item(index: 2),
      progress: -0.1,
      initialContentOffset: CGPoint(x: 100, y: 0),
      distance: -PagingControllerTests.ItemSize
    ))
    
    // Combine the method calls for the collection view and
    // collection view layout to ensure that they were called in
    // the correct order.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionView(.setContentOffset(
        contentOffset: CGPoint(x: 95, y: 0),
        animated: false
      )),
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  func testContentOffsetFromSelectedProgressZero() {
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled, but the progress is zero.
    pagingController.contentScrolled(progress: 0)
    
    // Expect to not update the state or call any methods.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 3)
    ))
  }
  
  func testContentScrolledNoUpcomingPagingItem() {
    // Prevent the data source from returning an upcoming item.
    dataSource.maxIndexAfter = 3
    
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.1)
    
    // Expect that the content offset is not updated.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  func testContentScrolledSizeDelegate() {
    // Setup the size delegate.
    sizeDelegate = MockPagingControllerSizeDelegate()
    sizeDelegate?.pagingItemWidth = { 100 }
    pagingController.sizeDelegate = sizeDelegate
    
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.1)
    
    // Expect it to invalidate the collection view layout sizes.
    let action = collectionViewLayout.calls.last?.action
    XCTAssertEqual(action, .collectionViewLayout(.invalidateLayoutWithContext(
      invalidateSizes: true
    )))
  }
  
  func testContentScrolledNoUpcomingPagingItemAndSizeDelegate() {
    // Prevent the data source from returning an upcoming item.
    dataSource.maxIndexAfter = 3
    
    // Setup the size delegate.
    sizeDelegate = MockPagingControllerSizeDelegate()
    sizeDelegate?.pagingItemWidth = { 100 }
    pagingController.sizeDelegate = sizeDelegate
    
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 3), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.1)
    
    // Expect it does not update the content offset or invalidate the sizes.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  func testContentScrolledUpcomingItemOutsideVisibleItems() {
    // Select the first item, and scroll to the edge of the
    // collection view a few times to make sure the selected
    // item is no longer in view.
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    collectionView.contentOffset = CGPoint(x: 150, y: 0)
    pagingController.menuScrolled()
    collectionView.contentOffset = CGPoint(x: 200, y: 0)
    pagingController.menuScrolled()
    collectionView.contentOffset = CGPoint(x: 250, y: 0)
    pagingController.menuScrolled()
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.5)
    
    // The visible items should now contain the items that were
    // visible before scrolling (6..10), plus the items around
    // the selected item (0...4).
    XCTAssertEqual(pagingController.visibleItems.items as? [Item], [
      Item(index: 0),
      Item(index: 1),
      Item(index: 2),
      Item(index: 3),
      Item(index: 4),
      Item(index: 6),
      Item(index: 7),
      Item(index: 8),
      Item(index: 9),
      Item(index: 10)
    ])
    
    // Combine the method calls for the collection view and
    // collection view layout to ensure that they were called in
    // the correct order.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionView(.reloadData),
      .collectionViewLayout(.prepare),
      .collectionView(.contentOffset(CGPoint(x: 400, y: 0))),
      .collectionView(.layoutIfNeeded),
      .collectionView(.setContentOffset(
        contentOffset: CGPoint(x: 225, y: 0),
        animated: false
        )),
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  func testContentScrolledProgressChangedFromPositiveToNegative() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    pagingController.contentScrolled(progress: 0.1)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user change scroll direction.
    pagingController.contentScrolled(progress: -0.1)
    
    // Expect that it enters the selected state.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 1)
    ))
  }
  
  func testContentScrolledProgressChangedFromNegativeToPositive() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    pagingController.contentScrolled(progress: -0.1)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the user change scroll direction.
    pagingController.contentScrolled(progress: 0.1)
    
    // Expect that it enters the selected state.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 1)
    ))
  }
  
  func testContentScrolledProgressChangedToZero() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    pagingController.contentScrolled(progress: -0.1)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the progress changes to zero.
    pagingController.contentScrolled(progress: 0)
    
    // Expect that it enters the selected state.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 1)
    ))
  }
  
  func testContentScrolledProgressChangedSameSign() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    pagingController.contentScrolled(progress: 0.1)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    
    // Simulate that the progress changes to zero.
    pagingController.contentScrolled(progress: 0.2)
    
    // Expect it to update the scrolling state and update the content offset.
    XCTAssertEqual(pagingController.state, PagingState.scrolling(
      pagingItem: Item(index: 1),
      upcomingPagingItem: Item(index: 2),
      progress: 0.2,
      initialContentOffset: CGPoint(x: 100, y: 0),
      distance: PagingControllerTests.ItemSize
    ))
    
    // Combine the method calls for the collection view and
    // collection view layout to ensure that they were called in
    // the correct order.
    let actions = combinedActions(collectionView.calls, collectionViewLayout.calls)
    XCTAssertEqual(actions, [
      .collectionView(.setContentOffset(
        contentOffset: CGPoint(x: 110, y: 0),
        animated: false
      )),
      .collectionViewLayout(.invalidateLayoutWithContext(
        invalidateSizes: false
      ))
    ])
  }
  
  // MARK: - Select item
  
  func testSelectWhileEmpty() {
    // Make sure there is no item before index 0.
    dataSource.minIndexBefore = 0
    
    // Make sure we have a superview and window
    collectionView.superview = UIView(frame: .zero)
    collectionView.window = UIWindow(frame: .zero)
    
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Expect it to enter selected state.
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 0)
    ))
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    XCTAssertEqual(actions, [
      .collectionView(.reloadData),
      .collectionViewLayout(.prepare),
      .collectionView(.contentOffset(.zero)),
      .collectionView(.layoutIfNeeded),
      .delegate(.selectContent(
        pagingItem: Item(index: 0),
        direction: PagingDirection.none,
        animated: false
      )),
      .collectionView(.selectItem(
        indexPath: IndexPath(item: 0, section: 0),
        animated: false,
        scrollPosition: .left
      )),
      .collectionView(.contentOffset(CGPoint(x: 0, y: 0)))
    ])
  }
  
  func testSelectWhileEmptyAndNoSuperview() {
    // Remove the superview.
    collectionView.superview = nil
    
    // Select the first item.
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Expect it to enter the selected state with no actions.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(delegate.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 0)
    ))
  }
  
  func testSelectWhileEmptyAndNoWindow() {
    // Remove the window and make sure we have a superview.
    collectionView.superview = UIView(frame: .zero)
    collectionView.window = nil
    
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Expect it to enter the selected state with no actions.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(delegate.calls, [])
    XCTAssertEqual(pagingController.state, PagingState.selected(
      pagingItem: Item(index: 0)
    ))
  }
  
  func testSelectItemWhileScrolling() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    pagingController.contentScrolled(progress: -0.1)
    
    // Reset the mock call count and store the state.
    let oldState = pagingController.state
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select the third item.
    pagingController.select(pagingItem: Item(index: 2), animated: false)
    
    // Expect it do not change the state.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(delegate.calls, [])
    XCTAssertEqual(pagingController.state, oldState)
  }
  
  func testSelectSameItem() {
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Reset the mock call count and store the state.
    let oldState = pagingController.state
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select the already selected item.
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Expect it do not change the state.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(delegate.calls, [])
    XCTAssertEqual(pagingController.state, oldState)
  }
  
  func testSelectDifferentItem() {
    // Make sure there is no item before index 0.
    dataSource.minIndexBefore = 0
    
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    
    // Reset the mock call count and store the state.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select a new item.
    pagingController.select(pagingItem: Item(index: 0), animated: true)
    
    // Expect it to enter the scrolling state.
    XCTAssertEqual(pagingController.state, PagingState.scrolling(
      pagingItem: Item(index: 1),
      upcomingPagingItem: Item(index: 0),
      progress: 0,
      initialContentOffset: CGPoint(x: 50, y: 0),
      distance: -PagingControllerTests.ItemSize
    ))
  }
  
  func testSelectPreviousSibling() {
    // Make sure there is no item before index 0.
    dataSource.minIndexBefore = 0
    
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    
    // Reset the mock call count and store the state.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select the previous sibling.
    pagingController.select(pagingItem: Item(index: 0), animated: true)
    
    // Expect it to select the previous content view.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(actions(delegate.calls), [
      .delegate(.selectContent(
        pagingItem: Item(index: 0),
        direction: .reverse(sibling: true),
        animated: true
      ))
    ])
  }
  
  func testSelectNextSibling() {
    // Make sure there is no item before index 0.
    dataSource.minIndexBefore = 0
    
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    
    // Reset the mock call count and store the state.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select the previous sibling.
    pagingController.select(pagingItem: Item(index: 2), animated: true)
    
    // Expect it to select the previous content view.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(actions(delegate.calls), [
      .delegate(.selectContent(
        pagingItem: Item(index: 2),
        direction: .forward(sibling: true),
        animated: true
      ))
    ])
  }
  
  func testSelectNotSibling() {
    // Make sure there is no item before index 0.
    dataSource.minIndexBefore = 0
    
    // Select an item and enter the scrolling state.
    pagingController.select(pagingItem: Item(index: 1), animated: false)
    
    // Reset the mock call count and store the state.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select an item that is not the sibling of the selected item.
    pagingController.select(pagingItem: Item(index: 4), animated: true)
    
    // Expect it to select the content view.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(actions(delegate.calls), [
      .delegate(.selectContent(
        pagingItem: Item(index: 4),
        direction: .forward(sibling: false),
        animated: true
      ))
    ])
  }
  
  func testSelectItemOutsideVisibleItems() {
    // Select the first item, and scroll to the edge of the
    // collection view a few times to make sure the selected
    // item is no longer in view.
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    collectionView.contentOffset = CGPoint(x: 150, y: 0)
    pagingController.menuScrolled()
    collectionView.contentOffset = CGPoint(x: 200, y: 0)
    pagingController.menuScrolled()
    collectionView.contentOffset = CGPoint(x: 250, y: 0)
    pagingController.menuScrolled()
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Select the item next to the selected item, which is now
    // scrolled out of view.
    pagingController.select(pagingItem: Item(index: 1), animated: true)
    
    // The visible items should now contain the items that were
    // visible before scrolling (6..10), plus the items around
    // the selected item (0...4).
    XCTAssertEqual(pagingController.visibleItems.items as? [Item], [
      Item(index: 0),
      Item(index: 1),
      Item(index: 2),
      Item(index: 3),
      Item(index: 4),
      Item(index: 6),
      Item(index: 7),
      Item(index: 8),
      Item(index: 9),
      Item(index: 10)
    ])
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    XCTAssertEqual(actions, [
      .collectionView(.reloadData),
      .collectionViewLayout(.prepare),
      .collectionView(.contentOffset(CGPoint(x: 400, y: 0))),
      .collectionView(.layoutIfNeeded),
      .delegate(.selectContent(
        pagingItem: Item(index: 1),
        direction: .forward(sibling: true),
        animated: true
      ))
    ])
  }
  
  // MARK: - Content finished scrolling
  
  func testContentFinishedScrollingWithUpcomingItem() {
    // Select an item and enter the scrolling state.
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    pagingController.contentScrolled(progress: 0.5)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Trigger the event.
    pagingController.contentFinishedScrolling()
    
    // Expect it to enter the selected state with the upcoming item.
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 1)))
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    // Expect it to reload data, update the layout and select the item
    // in the collectio view.
    XCTAssertEqual(actions, [
      .collectionView(.reloadData),
      .collectionViewLayout(.prepare),
      .collectionView(.contentOffset(CGPoint(x: 0, y: 0))),
      .collectionView(.layoutIfNeeded),
      .collectionView(.selectItem(
        indexPath: IndexPath(item: 1, section: 0),
        animated: false,
        scrollPosition: .left
      )),
      .collectionView(.contentOffset(CGPoint(x: 50, y: 0)))
    ])
  }
  
  func testContentFinishedScrollingCollectionViewBeingDragged() {
    // Select an item and enter the scrolling state.
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    pagingController.contentScrolled(progress: 0.5)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Set the collection view to being dragged.
    collectionView.isDragging = true
    pagingController.contentFinishedScrolling()
    
    // Expect it to not update the collection view.
    XCTAssertEqual(collectionView.calls, [])
    XCTAssertEqual(collectionViewLayout.calls, [])
    XCTAssertEqual(delegate.calls, [])
  }
  
  func testContentFinishedScrollingWihtoutUpcomingItem() {
    // Select an item and enter the scrolling state.
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    pagingController.contentScrolled(progress: -0.5)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Trigger the event.
    pagingController.contentFinishedScrolling()
    
    // Expect it to set the selected item to equal the current paging item.
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 0)))
  }
  
  // MARK: - Transition size
  
  func testTransitionSize() {
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Trigger the event.
    pagingController.transitionSize()
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    // Expect it to reload data, update the layout and selects the
    // current item.
    XCTAssertEqual(actions, [
      .collectionView(.reloadData),
      .collectionViewLayout(.prepare),
      .collectionView(.contentOffset(.zero)),
      .collectionView(.layoutIfNeeded),
      .collectionView(.selectItem(
        indexPath: IndexPath(item: 0, section: 0),
        animated: false,
        scrollPosition: .left
      )),
      .collectionView(.contentOffset(.zero))
    ])
  }
  
  func testTransitionSizeWhenSelected() {
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Trigger the transition event.
    pagingController.transitionSize()
    
    // Expect it to not update the state.
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 0)))
  }
  
  func testTransitionSizeWhenScrolling() {
    dataSource.minIndexBefore = 0
    pagingController.select(pagingItem: Item(index: 0), animated: false)
    
    // Reset the mock call count.
    collectionView.calls = []
    collectionViewLayout.calls = []
    delegate.calls = []
    
    // Simulate that the user scrolled to the next page.
    pagingController.contentScrolled(progress: 0.5)
    
    // Trigger the transition event.
    pagingController.transitionSize()
    
    // Expect it to select the current item.
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 0)))
  }
  
  // MARK: - Reload data
  
  func testReloadData() {
    pagingController.reloadData(around: Item(index: 2))
    
    // Expect it to select the given item
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 2)))
    
    // Expect it to generate items around the given item
    XCTAssertTrue(pagingController.visibleItems.hasItemsBefore)
    XCTAssertTrue(pagingController.visibleItems.hasItemsAfter)
    XCTAssertEqual(pagingController.visibleItems.items as? [Item], [
      Item(index: 0),
      Item(index: 1),
      Item(index: 2),
      Item(index: 3),
      Item(index: 4)
    ])
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    // Expect it to reload data in the collection view and update the
    // content view with the new view controllers.
    XCTAssertEqual(actions, [
      .collectionViewLayout(.invalidateLayout),
      .collectionView(.reloadData),
      .delegate(.removeContent),
      .delegate(.selectContent(
        pagingItem: Item(index: 2),
        direction: .none,
        animated: false
      )),
      .collectionViewLayout(.invalidateLayout)
    ])
  }
  
  // MARK: - Reload menu
  
  func testReloadMenu() {
    pagingController.reloadMenu(around: Item(index: 2))
    
    // Expect it to select the given item
    XCTAssertEqual(pagingController.state, .selected(pagingItem: Item(index: 2)))
    
    // Expect it to generate items around the given item
    XCTAssertTrue(pagingController.visibleItems.hasItemsBefore)
    XCTAssertTrue(pagingController.visibleItems.hasItemsAfter)
    XCTAssertEqual(pagingController.visibleItems.items as? [Item], [
      Item(index: 0),
      Item(index: 1),
      Item(index: 2),
      Item(index: 3),
      Item(index: 4)
    ])
    
    // Combine the method calls for the collection view,
    // collection view layout and delegate to ensure that
    // they were called in the correct order.
    let actions = combinedActions(
      collectionView.calls,
      collectionViewLayout.calls,
      delegate.calls
    )
    
    // Expect it to reload data in the collection view, but leave the
    // content view unchanged.
    XCTAssertEqual(actions, [
      .collectionViewLayout(.invalidateLayout),
      .collectionView(.reloadData)
    ])
  }
}
