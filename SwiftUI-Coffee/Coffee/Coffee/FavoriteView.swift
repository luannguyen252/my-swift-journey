import SwiftUI

struct FavoriteView: View {
    let count: Int
    private let maxCount = 5
    var body: some View {
        HStack {
            ForEach(0..<count) { row in
                Image(systemName: "star.fill")
            }
            ForEach(0..<(maxCount-count)) { row in
                Image(systemName: "star")
            }
        }
        .foregroundColor(.yellow)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(count: 3)
            .previewLayout(.sizeThatFits)
    }
}
