import Foundation

struct GrocerySliderItem {
  let title: String
  let subTitle: String
  let image: String
}

extension GrocerySliderItem: Identifiable {
  var id: String { title }
}

extension GrocerySliderItem {
  static let items: [GrocerySliderItem] = [
    GrocerySliderItem(title: "Great Recipe", subTitle: "Healthy Outside", image: "vegetable2"),
    GrocerySliderItem(title: "For Your Breakfast", subTitle: "Healthy Outside", image: "vegetable1")
  ]
}
