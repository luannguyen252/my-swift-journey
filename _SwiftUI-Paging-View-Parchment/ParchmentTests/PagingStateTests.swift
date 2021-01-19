import Foundation
import XCTest
@testable import Parchment

final class PagingStateTests: XCTestCase {
  func testSelected() {
    let state: PagingState = .selected(pagingItem: Item(index: 0))
    
    XCTAssertEqual(state.currentPagingItem as? Item?, Item(index: 0))
    XCTAssertNil(state.upcomingPagingItem)
    XCTAssertEqual(state.progress, 0)
    XCTAssertEqual(state.visuallySelectedPagingItem as? Item?, Item(index: 0))
  }
  
  func testScrollingCurrentPagingItem() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: Item(index: 1),
      progress: 0,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.currentPagingItem as? Item?, Item(index: 0))
  }
  
  func testProgress() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: Item(index: 1),
      progress: 0.5,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.progress, 0.5)
  }
  
  func testUpcomingPagingItem() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: Item(index: 1),
      progress: 0,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.upcomingPagingItem as? Item?, Item(index: 1))
  }
  
  func testUpcomingPagingItemNil() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: nil,
      progress: 0,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertNil(state.upcomingPagingItem)
  }
  
  func testVisuallySelectedPagingItemProgressLarge() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: Item(index: 1),
      progress: 0.6,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.visuallySelectedPagingItem as? Item?, Item(index: 1))
  }
  
  func testVisuallySelectedPagingItemProgressSmall() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: Item(index: 1),
      progress: 0.3,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.visuallySelectedPagingItem as? Item?, Item(index: 0))
  }
  
  func testVisuallySelectedPagingItemUpcomingPagingItemNil() {
    let state: PagingState = .scrolling(
      pagingItem: Item(index: 0),
      upcomingPagingItem: nil,
      progress: 0.6,
      initialContentOffset: .zero,
      distance: 0)
    
    XCTAssertEqual(state.visuallySelectedPagingItem as? Item?, Item(index: 0))
  }
}
