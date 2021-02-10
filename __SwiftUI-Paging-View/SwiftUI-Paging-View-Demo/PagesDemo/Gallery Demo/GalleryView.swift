import SwiftUI
import Pages

struct GalleryView: View {
    @State var index: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("My Art Collection")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal, .top])
            ModelPages(paintings, currentPage: $index, hasControl: false) { i, painting in
                PaintingView(painting: painting)
            }
            Spacer()
        }
    }

}

private struct PaintingView: View {
    var painting: Painting

    var body: some View {
        VStack {
            Image(painting.image)
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Text(painting.title)
                    .font(.system(size: 30, weight: .bold))
                Text(painting.author)
                    .foregroundColor(.secondary)
                Text(painting.about)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top)
            }
            Button(action: {}) {
                HStack {
                    Spacer()
                    Text("Buy for $\(painting.price)")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
