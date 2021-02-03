import SwiftUI

struct GroceryReview: View {
  let rating: Int

  var body: some View {
    ZStack{
      Color.orange
      HStack(spacing: 3){
        ForEach( 1..<6 ){ id in
          let color = id <= rating ? Color.white : Color.white.opacity(0.4)

          Image(systemName: "star.fill")
            .foregroundColor(color)
            .font(.caption)
        }
      }
    }
    .frame(height: 30)
    .clipShape(RoundedRectangle(cornerRadius: 25))
  }
}

struct GroceryReview_Previews: PreviewProvider {
  static var previews: some View {
    GroceryReview(rating: 3)
  }
}
