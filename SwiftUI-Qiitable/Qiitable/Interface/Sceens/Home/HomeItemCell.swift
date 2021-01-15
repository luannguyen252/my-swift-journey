import SwiftUI
import URLImage

struct HomeItemCell: View {
    private let item: Item

    init(item: Item) {
        self.item = item
    }

    var body: some View {
        HStack {
            URLImage(item.user.profileImageUrl.getProfileURL()) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 44, height: 44)
            .cornerRadius(22)
            Spacer()
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()

                Text("@" + item.user.id)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)

                TagsView(tags: item.tags)
                    .padding(.top, 4)
            }
        }
    }
}

struct HomeItemCell_Previews: PreviewProvider {
    static var previews: some View {
        return HomeItemCell(item: ItemFixture.test())
    }
}
