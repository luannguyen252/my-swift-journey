import Foundation

struct GroceryItem {
  let name: String
  let currentPrice: Double
  let regularPrice: Double
  let image: String
  let rating: Int
}

extension GroceryItem: Identifiable {
  var id: String { name }
}

extension GroceryItem {
  static let items: [GroceryItem] = [
    GroceryItem(
      name: "Basil Leaves and Avocado on Slice",
      currentPrice: 5.2,
      regularPrice: 9.99,
      image: "GroceryItem4",
      rating: 4
    ),
    GroceryItem(
      name: "Chicken Egg Indonesia",
      currentPrice: 16.12,
      regularPrice: 19.99,
      image: "GroceryItem3",
      rating: 3
    ),
    GroceryItem(
      name: "Avocado Salad With Yoghurt",
      currentPrice: 5.8,
      regularPrice: 9.79,
      image: "GroceryItem2",
      rating: 2
    ),
    GroceryItem(
      name: "Fresh Green Fruits Juice Combo",
      currentPrice: 8.6,
      regularPrice: 11.49,
      image: "GroceryItem1",
      rating: 5
    )
  ]
}
