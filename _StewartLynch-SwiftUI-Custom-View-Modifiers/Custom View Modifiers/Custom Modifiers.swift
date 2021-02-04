import SwiftUI

struct Tag: ViewModifier {
    enum BGColor {
        case fixedColor(color: Color)
        case randomColor
    }
    
    let bgColor: BGColor
    let opacity: Double
    
    func body(content: Content) -> some View {
        let tagColor: Color
        
        switch bgColor {
        case .fixedColor(color: let color):
            tagColor = color
        case .randomColor:
            tagColor = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
        }
        return content
            .font(Font.caption.weight(.bold))
            .padding(5)
            .background(tagColor)
            .opacity(opacity)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
}

extension View {
    func tag(_ bgColor: Tag.BGColor, opacity: Double = 1) -> some View {
        self.modifier(Tag(bgColor: bgColor, opacity: opacity))
    }
}

struct CenterInList: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func centerInList() -> some View {
        self.modifier(CenterInList())
    }
}

extension Image {
    func displayImage(width: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

struct OverlayCaption: ViewModifier {
    let caption: String
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(caption)
                    .tag(.fixedColor(color: .black), opacity: 0.6)
                    .padding(5),
                alignment: .bottomTrailing
            )
    }
}

extension View {
    func overlayCaption(caption: String) -> some View {
        self.modifier(OverlayCaption(caption: caption))
    }
}
