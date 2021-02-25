import SwiftUI

struct ContentView: View {
    var body: some View {
        ProductCard(
            title: "SMOOTHIE BOWL",
            description: "With extra coconut",
            image: Image("avatar1"),
            price: 15.00,
            peopleCount: 2,
            ingredientCount: 12,
            category: "FEELING FIT",
            buttonHandler: nil)
            .padding(.horizontal)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
