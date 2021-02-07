import SwiftUI

struct AddDashedCardStyle: ViewModifier {
    @Environment(\.layoutDirection) var layoutDirection
    var notchSize: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .overlay(overlay)
            .clipShape(notchedShape(cornerRadius: 20))
            .modifier(Shadow(shape: notchedShape(cornerRadius: 20)))
    }

    private var overlay: some View {
        notchedShape(cornerRadius: 16)
            .stroke(style: .init(lineWidth: 2, dash: [5, 5], dashPhase: 3))
            .foregroundColor(Color.white)
            .padding(5)
    }

    private func notchedShape(cornerRadius: CGFloat) -> NotchedRoundedRectangle {
        NotchedRoundedRectangle(
            layoutDirection: _layoutDirection,
            notchSize: notchSize,
            cornerRadius: cornerRadius
        )
    }
}

struct NotchedRoundedRectangle: Shape {
    @Environment(\.layoutDirection) var layoutDirection
    let notchSize: CGSize
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        if notchSize == .zero {
            let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
            path.addRoundedRect(in: rect, cornerSize: cornerSize)
            return path
        }

        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY),
            control: CGPoint(x: rect.minX, y: rect.minY)
        )
        path.addLine(to: CGPoint(x: rect.maxX - notchSize.width - cornerRadius, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - notchSize.width, y: rect.minY + cornerRadius),
            control: CGPoint(x: rect.maxX - notchSize.width, y: rect.minY)
        )
        path.addLine(to: CGPoint(x: rect.maxX - notchSize.width, y: rect.minY + notchSize.height - cornerRadius))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - notchSize.width + cornerRadius, y: rect.minY + notchSize.height),
            control: CGPoint(x: rect.maxX - notchSize.width, y: rect.minY + notchSize.height)
        )
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + notchSize.height))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY + notchSize.height + cornerRadius),
            control: CGPoint(x: rect.maxX, y: rect.minY + notchSize.height)
        )
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )

        path.closeSubpath()

        if layoutDirection == .rightToLeft {
            path = path
                .applying(.init(scaleX: -1, y: 1))
                .applying(.init(translationX: rect.maxX, y: 0 ))
        }

        return path
    }
}

struct AddDashedCardStyle_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle().modifier(AddDashedCardStyle(
            notchSize: CGSize(width: 90, height: 80)
        ))
        .frame(width: 200, height: 300)
    }
}
