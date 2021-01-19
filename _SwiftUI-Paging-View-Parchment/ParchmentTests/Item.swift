import Foundation
@testable import Parchment

struct Item: PagingItem, Equatable, Comparable {
  let index: Int
  
  var identifier: Int {
    return index
  }
}

func ==(lhs: Item, rhs: Item) -> Bool {
  return lhs.index == rhs.index
}

func <(lhs: Item, rhs: Item) -> Bool {
  return lhs.index < rhs.index
}

final class ItemCell: PagingCell {
  private(set) var item: Item?
  
  override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
    self.item = pagingItem as? Item
  }
}
