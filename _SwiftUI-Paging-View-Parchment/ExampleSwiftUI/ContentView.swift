import UIKit
import SwiftUI
import Parchment

struct ContentView: View {
  var body: some View {
    return PageView(items: [
      PagingIndexItem(index: 0, title: "View 0"),
      PagingIndexItem(index: 1, title: "View 1"),
      PagingIndexItem(index: 2, title: "View 2"),
      PagingIndexItem(index: 3, title: "View 3")
    ]) { item in
      Text(item.title)
        .font(.largeTitle)
        .foregroundColor(.gray)
    }
  }
}
