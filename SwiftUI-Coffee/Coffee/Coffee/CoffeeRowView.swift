import SwiftUI
import NeumorphismUI

struct CoffeeRowView: View {
    let coffeeType: CoffeeType
    let size: CGFloat = 88
    @State var showFavorite: Bool = false
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    @ViewBuilder
    var body: some View {
        HStack {
            coffeeType.image
                .resizedToFill(width: size, height: size)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading, spacing: 0) {
                Text(coffeeType.title)
                    .font(.headline)
                NeumorphismDentView(shapeType: .rectangle, width: 200, height: 2, color: Color.gray.opacity(0.2), cornerRadius: 4)
                Text(coffeeType.description)
                    .font(.subheadline)

                if showFavorite {
                    FavoriteView(count: coffeeType.rating)
                }
            }
        }
    }
}

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}

struct CoffeeRowContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            CoffeeRowView(coffeeType: .american),
            title: "Coffee Row effect",
            category: .effect
        )
        LibraryItem(
            CoffeeRowView(coffeeType: .american, showFavorite: true),
            title: "Coffee Row layout",
            category: .layout
        )
    }

    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.resizedToFill(width: 100, height: 100),
            title: "resizedToFill effect",
            category: .effect
        )
    }
}

struct CoffeeRowView_Previews: PreviewProvider {
    static let neumorphism: NeumorphismManager = .init(isDark: false, lightColor: Color(hex: "C1D2EB"), darkColor: Color(hex: "C1D2EB"))

    static var previews: some View {
        Group {
            CoffeeRowView(coffeeType: .blend)
            CoffeeRowView(coffeeType: .caramelMacchiato)
        }
        .environmentObject(neumorphism)
        .padding(.horizontal)
        .previewLayout(.sizeThatFits)
    }
}
