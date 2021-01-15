import SwiftUI

struct BarButtonView: View {
    var imageName: String
    var accessibilityName: String

    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .font(.system(size: 25))
            .foregroundColor(.primary)
            .accessibility(label: Text(accessibilityName))
            .frame(width: 25, height: 25, alignment: .trailing)
    }
}

struct BarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BarButtonView(imageName: "gear", accessibilityName: "Settings")
    }
}
