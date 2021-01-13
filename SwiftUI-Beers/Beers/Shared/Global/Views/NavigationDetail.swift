import SwiftUI

struct NavigationDetail: View {
    let beer: Beer

    var body: some View {
        BeerDetailScreen(beer: beer)
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(beer: .mock())
    }
}
