import SwiftUI

struct CardView: View {

    let card: CardModel

    var body: some View {
        ZStack(alignment: .topTrailing) {

            Image(card.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: .zero,
                       maxWidth: .infinity,
                        minHeight: .zero,
                        maxHeight: .infinity)
                .clipped()

            VStack {

                Spacer()

                VStack(alignment: .leading, spacing: 0) {
                    Text(card.header.uppercased())
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding()

                    CardBottomView(card: card)
                }
            }
        }
        .asCard()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardModel.sampleCard)
            .frame(width: UIScreen.main.bounds.width - 24,
                   height: 400)
    }
}
