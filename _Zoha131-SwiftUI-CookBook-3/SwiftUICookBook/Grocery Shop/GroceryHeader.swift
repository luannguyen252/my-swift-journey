import SwiftUI

struct GroceryHeader: View {
  let title: String
  let onClick: () -> Void

  var body: some View {
    HStack {
      Text(title)
        .font(.headline)
        .fontWeight(.regular)

      Spacer()

      Button(action: onClick) {
        Image(systemName: "chevron.right.circle")
          .resizable()
          .frame(width: 22, height: 22)
          .foregroundColor(.green)
      }
    }
  }
}

struct GroceryHeader_Previews: PreviewProvider {
  static var previews: some View {
    GroceryHeader(title: "", onClick: {})
  }
}
