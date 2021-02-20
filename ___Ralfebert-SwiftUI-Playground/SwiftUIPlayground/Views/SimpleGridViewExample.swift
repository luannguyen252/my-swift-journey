// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

extension Array {
    func chunks(_ size: Int) -> [[Element]] {
        stride(from: 0, to: self.count, by: size).map { ($0 ..< Swift.min($0 + size, self.count)).map { self[$0] } }
    }
}

struct Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct SimpleGridViewExample: View {

    var products = [Product(name: "p1"), Product(name: "p2"), Product(name: "p3"), Product(name: "p4"), Product(name: "p5")]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(products.chunks(2), id: \.self) { chunk in
                    HStack {
                        ForEach(chunk, id: \.self) { product in
                            VStack {

                                Image(systemName: "sun.max")
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .aspectRatio(contentMode: .fit)

                                Text(product.name)
                            }
                        }
                    }
                }
            }
        }
    }

}

struct SimpleGridViewExample_Previews: PreviewProvider {
    static var previews: some View {
        SimpleGridViewExample()
    }
}
