import SwiftUI

struct CardBottomView: View {

    let card: CardModel

    var body: some View {
        ZStack {
            BlurView(style: .light)
                .frame(height: 80)

            HStack {

                Image(card.image)
                    .asThumbnail()

                VStack(alignment: .leading) {
                    Text(card.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(card.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }

                Spacer()

                Button(action: {}) {
                    Text("Get")
                        .fontWeight(.bold)
                        .padding(8)
                        .frame(width: 65)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .clipShape(Capsule())
                }
                .buttonStyle(PlainButtonStyle())
                .padding([.trailing])
            }
        }
    }
}

struct CardBottomContainer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CardBottomView(card: CardModel.sampleCard)
        }
    }
}
