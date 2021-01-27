import SwiftUI

// Item
struct Item: Identifiable {
    var id: String = UUID().uuidString
}

// Item List
struct ItemList: Identifiable {
    var id: String = UUID().uuidString
    var items: [Item] = (0...50).map { _ in Item() }
    
    static var testLists: [ItemList] {
        (0...50).map { _ in ItemList() }
    }
}

// Item View
struct ItemView: View {
    var item: Item
    
    var body: some View {
        Button(action: { print("\(item.id)") }) {
            Text(item.id.prefix(2)).frame(minWidth: 200, minHeight: 200)
        }
        .id(item.id)
        .buttonStyle(CardButtonStyle())
    }
}
