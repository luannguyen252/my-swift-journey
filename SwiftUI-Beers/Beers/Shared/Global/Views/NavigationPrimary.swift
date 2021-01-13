import SwiftUI

struct NavigationPrimary: View {
    @ObservedObject var beerStore: BeerStore
    @Binding var selectedBeer: Beer?

    var body: some View {
        BeerListScreen(beerStore: beerStore, selection: $selectedBeer)
            .frame(minWidth: 250, minHeight: 700)
    }
}

struct NavigationPrimary_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPrimary(beerStore: .mock(), selectedBeer: .constant(nil))
    }
}
