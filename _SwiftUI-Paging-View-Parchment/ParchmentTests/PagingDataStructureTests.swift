import Foundation
import XCTest
@testable import Parchment

final class PagingDataTests: XCTestCase {
  var visibleItems: PagingItems!
  
  override func setUp() {
    visibleItems = PagingItems(items: [
      Item(index: 0),
      Item(index: 1),
      Item(index: 2)
    ])
  }
  
  func testIndexPathForPagingItemFound() {
    let indexPath = visibleItems.indexPath(for: Item(index: 0))!
    XCTAssertEqual(indexPath.item, 0)
  }
  
  func testIndexPathForPagingItemMissing() {
    let indexPath = visibleItems.indexPath(for: Item(index: -1))
    XCTAssertNil(indexPath)
  }
  
  func testPagingItemForIndexPath() {
    let indexPath = IndexPath(item: 0, section: 0)
    let pagingItem = visibleItems.pagingItem(for: indexPath) as! Item
    XCTAssertEqual(pagingItem, Item(index: 0))
  }
  
  func testDirectionForIndexPathForward() {
    let currentPagingItem = Item(index: 0)
    let upcomingPagingItem = Item(index: 1)
    let direction = visibleItems.direction(from: currentPagingItem, to: upcomingPagingItem)
    XCTAssertEqual(direction, PagingDirection.forward(sibling: true))
  }
  
  func testDirectionForIndexPathReverse() {
    let currentPagingItem = Item(index: 1)
    let upcomingPagingItem = Item(index: 0)
    let direction = visibleItems.direction(from: currentPagingItem, to: upcomingPagingItem)
    XCTAssertEqual(direction, PagingDirection.reverse(sibling: true))
  }
  
  func testDirectionForIndexPathNone() {
    let currentPagingItem = Item(index: -1)
    let upcomingPagingItem = Item(index: 0)
    let direction = visibleItems.direction(from: currentPagingItem, to: upcomingPagingItem)
    XCTAssertEqual(direction, PagingDirection.none)
  }
}
