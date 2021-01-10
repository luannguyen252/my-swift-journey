import SwiftUI
import NeumorphismUI

struct CoffeeList: View {
    @EnvironmentObject var neumorphism: NeumorphismManager

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Coffee List")
                .font(.title)
                .bold()
                .padding()

            List {
                ForEach(CoffeeType.allCases, id: \.title) { type in
                    CoffeeRowView(coffeeType: type, showFavorite: true)
                }
            }
        }
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
