import SwiftUI

struct SectionTitle: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            Spacer()
        }
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "Good evening").previewLayout(.sizeThatFits).background(Color.black)
    }
}
