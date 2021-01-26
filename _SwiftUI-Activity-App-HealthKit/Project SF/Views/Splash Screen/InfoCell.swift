import SwiftUI

struct InfoCell: View {
    var title: String
    var subTitle: String
    var imageName: String

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.top)
    }
}

struct InfoCell_Previews: PreviewProvider {
    static var previews: some View {
        InfoCell(title: "dsafs", subTitle: "112rqwff", imageName: "pencil")
    }
}
