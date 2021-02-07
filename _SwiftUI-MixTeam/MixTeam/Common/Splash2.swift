import SwiftUI

// swiftlint:disable function_body_length
struct Splash2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let firstPoint = CGPoint(
            x: rect.minX + rect.maxX * 280/1000,
            y: rect.minY + rect.maxY * 60/1000
        )
        path.move(to: firstPoint)

        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 550/1000,
                y: rect.minY + rect.maxY * 60/1000
            ),
            control: CGPoint(
                x: rect.minX + rect.maxX * 340/1000,
                y: rect.minY + rect.maxY * -60/1000
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 760/1000,
                y: rect.minY + rect.maxY * 95/1000
            ),
            control: CGPoint(
                x: rect.minX + rect.maxX * 650/1000,
                y: rect.minY + rect.maxY * 110/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 895/1000,
                y: rect.minY + rect.maxY * 200/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 900/1000,
                y: rect.minY + rect.maxY * 80/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 900/1000,
                y: rect.minY + rect.maxY * 170/1000
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 920/1000,
                y: rect.minY + rect.maxY * 350/1000
            ),
            control: CGPoint(
                x: rect.minX + rect.maxX * 860/1000,
                y: rect.minY + rect.maxY * 300/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 920/1000,
                y: rect.minY + rect.maxY * 600/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 1100/1000,
                y: rect.minY + rect.maxY * 480/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 910/1000,
                y: rect.minY + rect.maxY * 570/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 785/1000,
                y: rect.minY + rect.maxY * 850/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 930/1000,
                y: rect.minY + rect.maxY * 800/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 900/1000,
                y: rect.minY + rect.maxY * 920/1000
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 670/1000,
                y: rect.minY + rect.maxY * 910/1000
            ),
            control: CGPoint(
                x: rect.minX + rect.maxX * 720/1000,
                y: rect.minY + rect.maxY * 830/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 450/1000,
                y: rect.minY + rect.maxY * 930/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 610/1000,
                y: rect.minY + rect.maxY * 1050/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 530/1000,
                y: rect.minY + rect.maxY * 1000/1000
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 340/1000,
                y: rect.minY + rect.maxY * 900/1000
            ),
            control: CGPoint(
                x: rect.minX + rect.maxX * 420/1000,
                y: rect.minY + rect.maxY * 900/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 130/1000,
                y: rect.minY + rect.maxY * 700/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 50/1000,
                y: rect.minY + rect.maxY * 900/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 140/1000,
                y: rect.minY + rect.maxY * 750/1000
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 140/1000,
                y: rect.minY + rect.maxY * 260/1000
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 150/1000,
                y: rect.minY + rect.maxY * 530/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * -170/1000,
                y: rect.minY + rect.maxY * 490/1000
            )
        )

        path.addCurve(
            to: firstPoint,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 260/1000,
                y: rect.minY + rect.maxY * 150/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 230/1000,
                y: rect.minY + rect.maxY * 140/1000
            )
        )

        return path
    }
}

struct Splash2_Previews: PreviewProvider {
    static var previews: some View {
        Splash2().frame(width: 100, height: 100)
    }
}
