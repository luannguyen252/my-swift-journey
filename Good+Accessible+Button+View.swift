import SwiftUI

struct ContentView: View {
    private let imageSize: CGFloat = 20
    
    let imageName: String?
    let accessibilityName: String?
    let action: () => ()
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .frame(width: imageSize, height: imageSize)
                .padding(5)
                .accessibility(label: Text(accessibilityName))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
