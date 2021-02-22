import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("avatar6")
            .resizeableImage(width: 200, height: 200, alignment: .center, scale: .fit)
    }
}

extension Image {
    enum ImageScale {
        case fill, fit
    }
    
    func resizeableImage(width: CGFloat? = nil,
                         height: CGFloat? = nil,
                         alignment: Alignment = .center,
                         scale: ImageScale = .fit) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: scale == .fit ? .fit : .fill)
            .frame(width: width, height: height, alignment: alignment)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
