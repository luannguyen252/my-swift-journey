import SwiftUI

struct GroceryItemView: View {
  let groceryItem: GroceryItem

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      ZStack(alignment: .bottom) {
        Image(groceryItem.image)
          .resizable()
          .aspectRatio(149/167, contentMode: .fill)
          .clipShape(RoundedRectangle(cornerRadius: 12))

        GroceryReview(rating: groceryItem.rating)
          .offset(x: 0, y: 15)
          .padding(.horizontal)
      }
      .padding(.bottom)

      Text(groceryItem.name)
        .lineLimit(2)

      HStack{
        Text("$\(groceryItem.currentPrice, specifier: "%.2f")")
          .font(.headline)
          .foregroundColor(.green)

        Text("$\(groceryItem.regularPrice, specifier: "%.2f")")
          .foregroundColor(.gray)
      }
    }
  }
}
