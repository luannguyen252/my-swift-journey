import SwiftUI

struct TagsView: View {
    private let tags: [Tag]

    init(tags: [Tag]) {
        self.tags = tags
    }

    var body: some View {
        HStack {
            ForEach(tags, id: \.name) { (tag: Tag) in
                Text(tag.name ?? "")
                    .bold()
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5.0)
                    .padding(.vertical, 3.0)
                    .background(Color.gray)
                    .font(.caption)
                    .cornerRadius(4)
                    .layoutPriority(1)
            }
            Spacer()
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: [])
    }
}
