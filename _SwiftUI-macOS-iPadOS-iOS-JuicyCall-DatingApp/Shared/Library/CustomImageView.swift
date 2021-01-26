import Foundation
import SwiftUI


struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.imgAvatar(width: 25.0, height: 25.0),
            title: "Avatar Circular Images"
        )
    }
    
    @LibraryContentBuilder
    func mod(base: AnyView) -> [LibraryItem] {
        LibraryItem(
            base.gradientColour(),
            title: "Gradient Colour Backgournd"
        )
    }
}

//MARK: Image Avatar
extension Image {
    func imgAvatar(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}

extension View {
    func gradientColour(width: CGFloat = 100, height: CGFloat = 100) -> some View {
        self
            .frame(width: width, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 208/255, green: 45/255, blue: 208/255), Color(red:108/255, green:158/255, blue:255/255)]), startPoint: .trailing, endPoint: .topLeading))

    }
}
