import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            CardView(card: CardModel.sampleCard)
                .frame(width: geometry.size.width - 24,
                       height: geometry.size.height / 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
