import SwiftUI

struct Redactable: ViewModifier {
    let type: RedactionType?

    @ViewBuilder
    func body(content: Content) -> some View {
        switch type {
        case .customPlaceholder:
            content
                .modifier(Placeholder())
        case .scaled:
            content
                .modifier(Scaled())
        case .blurred:
            content
                .modifier(Blurred())
        case nil:
            content
        }
    }
}

struct Placeholder: ViewModifier {

    @State private var condition: Bool = false
    func body(content: Content) -> some View {
        content
            .accessibility(label: Text("Placeholder"))
            .redacted(reason: .placeholder)
            .opacity(condition ? 0.0 : 1.0)
            .animation(Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
            .onAppear { condition = true }
    }
}

struct Scaled: ViewModifier {

    @State private var condition: Bool = false
    func body(content: Content) -> some View {
        content
            .accessibility(label: Text("Scaled"))
            .redacted(reason: .placeholder)
            .scaleEffect(condition ? 0.9 : 1.0)
            .animation(Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
            .onAppear { condition = true }
    }
}

struct Blurred: ViewModifier {

    @State private var condition: Bool = false
    func body(content: Content) -> some View {
        content
            .accessibility(label: Text("Blurred"))
            .redacted(reason: .placeholder)
            .blur(radius: condition ? 0.0 : 4.0)
            .animation(Animation
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true))
            .onAppear { condition = true }
    }
}
