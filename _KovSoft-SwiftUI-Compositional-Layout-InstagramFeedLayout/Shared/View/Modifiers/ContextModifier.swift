import SwiftUI

struct ContextModifier: ViewModifier {
    // ContextMenu Modifier
    var card: Card
    
    func body(content: Content) -> some View {
        content
            .contextMenu(menuItems: {
                VStack(spacing: 4) {
                    Text("Photo by \(card.author)")
                    Text("Download")
                }
            })
            .contentShape(RoundedRectangle(cornerRadius: 4))
    }
}
