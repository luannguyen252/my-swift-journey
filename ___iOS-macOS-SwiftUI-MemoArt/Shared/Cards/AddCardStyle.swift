import SwiftUI

struct AddCardStyle: ViewModifier {
    var foregroundColor: Color

    func body(content: Content) -> some View {
        RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(foregroundColor)
            .overlay(
                content.clipShape(RoundedRectangle(cornerRadius: 8.0))
            )
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 1, x: 1, y: 1)
    }
}

#if DEBUG
struct AddCardStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello, World!")
                .bold()
                .foregroundColor(.yellow)
                .modifier(AddCardStyle(foregroundColor: .red))
                .frame(width: 150)
            Image("Pop Art")
                .resizable()
                .modifier(AddCardStyle(foregroundColor: .red))
                .frame(width: 150)
            Image("Shadow")
                .resizable()
                .modifier(AddCardStyle(foregroundColor: .black))
                .frame(width: 150)
        }
    }
}
#endif
