import Foundation

struct GroceryIngredient {
  let name: String
  let image: String
}

extension GroceryIngredient: Identifiable {
  var id: String { name }
}

extension GroceryIngredient {
  static let ingredients: [GroceryIngredient] = [
    GroceryIngredient (name: "Strawberry", image: "Ingredients1"),
    GroceryIngredient (name: "Corn", image: "Ingredients2"),
    GroceryIngredient (name: "Grapes", image: "Ingredients3"),
    GroceryIngredient (name: "Banana", image: "Ingredients4"),
    GroceryIngredient (name: "Coconut", image: "Ingredients5"),
    GroceryIngredient (name: "Aubergine", image: "Ingredients6"),
    GroceryIngredient (name: "Carrot", image: "Ingredients7"),
    GroceryIngredient (name: "Tomato", image: "Ingredients8")
  ]
}
