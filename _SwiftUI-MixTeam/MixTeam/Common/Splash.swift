import SwiftUI

// swiftlint:disable function_body_length type_body_length file_length
struct Splash: Shape {
    var animatableData: CGFloat = 1

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let point1 = CGPoint(
            x: rect.minX + rect.maxX * 140/1000,
            y: rect.minY + rect.maxY * 325/1000
        )
        path.move(to: point1)

        let point2 = CGPoint(
            x: rect.minX + rect.maxX * 200/1000,
            y: rect.minY + rect.maxY * 485/1000
        )
        path.addQuadCurve(
            to: point2,
            control: CGPoint(
                x: rect.minX + rect.maxX * 275/1000,
                y: rect.minY + rect.maxY * 435/1000
            )
        )

        let point3 = CGPoint(
            x: rect.minX + rect.maxX * 270/1000,
            y: rect.minY + rect.maxY * 560/1000
        )
        path.addQuadCurve(
            to: point3,
            control: CGPoint(
                x: rect.minX + rect.maxX * 120/1000,
                y: rect.minY + rect.maxY * 550/1000
            )
        )

        let point4 = CGPoint(
            x: rect.minX + rect.maxX * 300/1000,
            y: rect.minY + rect.maxY * 620/1000
        )
        path.addQuadCurve(
            to: point4,
            control: CGPoint(
                x: rect.minX + rect.maxX * 330/1000,
                y: rect.minY + rect.maxY * 570/1000
            )
        )

        let point5 = CGPoint(
            x: rect.minX + rect.maxX * 330/1000,
            y: rect.minY + rect.maxY * 660/1000
        )
        path.addQuadCurve(
            to: point5,
            control: CGPoint(
                x: rect.minX + rect.maxX * 275/1000,
                y: rect.minY + rect.maxY * 685/1000
            )
        )

        let point6 = CGPoint(
            x: rect.minX + rect.maxX * 410/1000,
            y: rect.minY + rect.maxY * 640/1000
        )
        path.addQuadCurve(
            to: point6,
            control: CGPoint(
                x: rect.minX + rect.maxX * 380/1000,
                y: rect.minY + rect.maxY * 630/1000
            )
        )

        addDripping1(path: &path, in: rect)
        addDripping2(path: &path, in: rect)

        let point14 = CGPoint(
            x: rect.minX + rect.maxX * 725/1000,
            y: rect.minY + rect.maxY * 600/1000
        )
        path.addQuadCurve(
            to: point14,
            control: CGPoint(
                x: rect.minX + rect.maxX * 680/1000,
                y: rect.minY + rect.maxY * 560/1000
            )
        )

        let point15 = CGPoint(
            x: rect.minX + rect.maxX * 740/1000,
            y: rect.minY + rect.maxY * 495/1000
        )
        path.addCurve(
            to: point15,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 695/1000,
                y: rect.minY + rect.maxY * 520/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 705/1000,
                y: rect.minY + rect.maxY * 490/1000
            )
        )

        let point16 = CGPoint(
            x: rect.minX + rect.maxX * 780/1000,
            y: rect.minY + rect.maxY * 420/1000
        )
        path.addCurve(
            to: point16,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 810/1000,
                y: rect.minY + rect.maxY * 505/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 820/1000,
                y: rect.minY + rect.maxY * 455/1000
            )
        )

        let point17 = CGPoint(
            x: rect.minX + rect.maxX * 810/1000,
            y: rect.minY + rect.maxY * 345/1000
        )
        path.addQuadCurve(
            to: point17,
            control: CGPoint(
                x: rect.minX + rect.maxX * 720/1000,
                y: rect.minY + rect.maxY * 370/1000
            )
        )

        let point18 = CGPoint(
            x: rect.minX + rect.maxX * 955/1000,
            y: rect.minY + rect.maxY * 315/1000
        )
        path.addQuadCurve(
            to: point18,
            control: CGPoint(
                x: rect.minX + rect.maxX * 910/1000,
                y: rect.minY + rect.maxY * 310/1000
            )
        )

        let point19 = CGPoint(
            x: rect.minX + rect.maxX * 940/1000,
            y: rect.minY + rect.maxY * 265/1000
        )
        path.addCurve(
            to: point19,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 995/1000,
                y: rect.minY + rect.maxY * 310/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 995/1000,
                y: rect.minY + rect.maxY * 250/1000
            )
        )

        let point20 = CGPoint(
            x: rect.minX + rect.maxX * 730/1000,
            y: rect.minY + rect.maxY * 270/1000
        )
        path.addCurve(
            to: point20,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 790/1000,
                y: rect.minY + rect.maxY * 330/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 780/1000,
                y: rect.minY + rect.maxY * 345/1000
            )
        )

        let point21 = CGPoint(
            x: rect.minX + rect.maxX * 740/1000,
            y: rect.minY + rect.maxY * 220/1000
        )
        path.addQuadCurve(
            to: point21,
            control: CGPoint(
                x: rect.minX + rect.maxX * 710/1000,
                y: rect.minY + rect.maxY * 230/1000
            )
        )

        let point22 = CGPoint(
            x: rect.minX + rect.maxX * 720/1000,
            y: rect.minY + rect.maxY * 188/1000
        )
        path.addCurve(
            to: point22,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 760/1000,
                y: rect.minY + rect.maxY * 215/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 770/1000,
                y: rect.minY + rect.maxY * 180/1000
            )
        )

        let point23 = CGPoint(
            x: rect.minX + rect.maxX * 690/1000,
            y: rect.minY + rect.maxY * 155/1000
        )
        path.addQuadCurve(
            to: point23,
            control: CGPoint(
                x: rect.minX + rect.maxX * 650/1000,
                y: rect.minY + rect.maxY * 200/1000
            )
        )

        let point24 = CGPoint(
            x: rect.minX + rect.maxX * 650/1000,
            y: rect.minY + rect.maxY * 125/1000
        )
        path.addQuadCurve(
            to: point24,
            control: CGPoint(
                x: rect.minX + rect.maxX * 730/1000,
                y: rect.minY + rect.maxY * 110/1000
            )
        )

        let point25 = CGPoint(
            x: rect.minX + rect.maxX * 590/1000,
            y: rect.minY + rect.maxY * 80/1000
        )
        path.addQuadCurve(
            to: point25,
            control: CGPoint(
                x: rect.minX + rect.maxX * 570/1000,
                y: rect.minY + rect.maxY * 140/1000
            )
        )

        let point26 = CGPoint(
            x: rect.minX + rect.maxX * 540/1000,
            y: rect.minY + rect.maxY * 40/1000
        )
        path.addCurve(
            to: point26,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 610/1000,
                y: rect.minY + rect.maxY * 0/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 560/1000,
                y: rect.minY + rect.maxY * 0/1000
            )
        )

        let point27 = CGPoint(
            x: rect.minX + rect.maxX * 445/1000,
            y: rect.minY + rect.maxY * 60/1000
        )
        path.addQuadCurve(
            to: point27,
            control: CGPoint(
                x: rect.minX + rect.maxX * 500/1000,
                y: rect.minY + rect.maxY * 140/1000
            )
        )

        let point28 = CGPoint(
            x: rect.minX + rect.maxX * 390/1000,
            y: rect.minY + rect.maxY * 70/1000
        )
        path.addQuadCurve(
            to: point28,
            control: CGPoint(
                x: rect.minX + rect.maxX * 410/1000,
                y: rect.minY + rect.maxY * 15/1000
            )
        )

        let point29 = CGPoint(
            x: rect.minX + rect.maxX * 330/1000,
            y: rect.minY + rect.maxY * 105/1000
        )
        path.addQuadCurve(
            to: point29,
            control: CGPoint(
                x: rect.minX + rect.maxX * 360/1000,
                y: rect.minY + rect.maxY * 140/1000
            )
        )

        let point30 = CGPoint(
            x: rect.minX + rect.maxX * 312/1000,
            y: rect.minY + rect.maxY * 110/1000
        )
        path.addQuadCurve(
            to: point30,
            control: CGPoint(
                x: rect.minX + rect.maxX * 315/1000,
                y: rect.minY + rect.maxY * 90/1000
            )
        )

        let point31 = CGPoint(
            x: rect.minX + rect.maxX * 175/1000,
            y: rect.minY + rect.maxY * 205/1000
        )
        path.addCurve(
            to: point31,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 300/1000,
                y: rect.minY + rect.maxY * 190/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 240/1000,
                y: rect.minY + rect.maxY * 220/1000
            )
        )

        let point32 = CGPoint(
            x: rect.minX + rect.maxX * 90/1000,
            y: rect.minY + rect.maxY * 150/1000
        )

        path.addCurve(
            to: point32,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 165/1000,
                y: rect.minY + rect.maxY * 205/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 100/1000,
                y: rect.minY + rect.maxY * 150/1000
            )
        )

        let point33 = CGPoint(
            x: rect.minX + rect.maxX * 90/1000,
            y: rect.minY + rect.maxY * 205/1000
        )
        path.addCurve(
            to: point33,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 35/1000,
                y: rect.minY + rect.maxY * 120/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 30/1000,
                y: rect.minY + rect.maxY * 195/1000
            )
        )

        path.addCurve(
            to: point1,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 290/1000,
                y: rect.minY + rect.maxY * 215/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 230/1000,
                y: rect.minY + rect.maxY * 340/1000
            )
        )

        addBubble1(path: &path, in: rect)
        addBubble2(path: &path, in: rect)
        addDrop1(path: &path, in: rect)
        addDrop2(path: &path, in: rect)
        addDrop3(path: &path, in: rect)

        return path
    }

    private func addDripping1(path: inout Path, in rect: CGRect) {
        let start = CGPoint(
            x: rect.minX + rect.maxX * 470/1000,
            y: rect.minY + rect.maxY * 730/1000 + rect.maxY * 260/1000 * animatableData
        )
        path.addCurve(
            to: start,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 500/1000 + rect.maxX * 30/1000 * animatableData,
                y: rect.minY + rect.maxY * 650/1000 + rect.maxY * 10/1000 * animatableData
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 420/1000 - rect.maxX * 70/1000 * animatableData,
                y: rect.minY + rect.maxY * 720/1000 + rect.maxY * 250/1000 * animatableData
            )
        )

        let end = CGPoint(
            x: rect.minX + rect.maxX * 530/1000,
            y: rect.minY + rect.maxY * 640/1000
        )
        path.addCurve(
            to: end,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 500/1000 + rect.maxX * 50/1000 * animatableData,
                y: rect.minY + rect.maxY * 720/1000 + rect.maxY * 280/1000 * animatableData
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 450/1000,
                y: rect.minY + rect.maxY * 650/1000
            )
        )
    }

    private func addDripping2(path: inout Path, in rect: CGRect) {
        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 580/1000 + rect.maxX * 20/1000 * animatableData,
                y: rect.minY + rect.maxY * 660/1000 + rect.maxY * 170/1000 * animatableData
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 550/1000 + rect.maxX * 90/1000 * animatableData,
                y: rect.minY + rect.maxY * 670/1000 - rect.maxY * 20/1000 * animatableData
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 550/1000 - rect.maxX * 40/1000 * animatableData,
                y: rect.minY + rect.maxY * 670/1000 + rect.maxY * 160/1000 * animatableData
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.minX + rect.maxX * 600/1000 + rect.maxX * 50/1000 * animatableData,
                y: rect.minY + rect.maxY * 640/1000 - rect.maxY * 40/1000 * animatableData
            ),
            control1: CGPoint(
                x: rect.minX + rect.maxX * 600/1000 + rect.maxX * 70/1000 * animatableData,
                y: rect.minY + rect.maxY * 640/1000 + rect.maxY * 160/1000 * animatableData
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 600/1000 - rect.maxX * 70/1000 * animatableData,
                y: rect.minY + rect.maxY * 650/1000 - rect.maxY * 30/1000 * animatableData
            )
        )
    }

    private func addBubble1(path: inout Path, in rect: CGRect) {
        let point1 = CGPoint(
            x: rect.minX + rect.maxX * 280/1000,
            y: rect.minY + rect.maxY * 715/1000
        )
        path.move(to: point1)

        let point2 = CGPoint(
            x: rect.minX + rect.maxX * 240/1000,
            y: rect.minY + rect.maxY * 690/1000
        )
        path.addCurve(
            to: point2,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 290/1000,
                y: rect.minY + rect.maxY * 707/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 280/1000,
                y: rect.minY + rect.maxY * 655/1000
            )
        )

        path.addCurve(
            to: point1,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 220/1000,
                y: rect.minY + rect.maxY * 710/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 250/1000,
                y: rect.minY + rect.maxY * 740/1000
            )
        )
    }

    private func addBubble2(path: inout Path, in rect: CGRect) {
        let point1 = CGPoint(
            x: rect.minX + rect.maxX * 385/1000,
            y: rect.minY + rect.maxY * 715/1000
        )
        path.move(to: point1)

        let point2 = CGPoint(
            x: rect.minX + rect.maxX * 320/1000,
            y: rect.minY + rect.maxY * 700/1000
        )
        path.addCurve(
            to: point2,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 390/1000,
                y: rect.minY + rect.maxY * 660/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 340/1000,
                y: rect.minY + rect.maxY * 660/1000
            )
        )

        path.addCurve(
            to: point1,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 300/1000,
                y: rect.minY + rect.maxY * 740/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 380/1000,
                y: rect.minY + rect.maxY * 760/1000
            )
        )
    }

    private func addDrop1(path: inout Path, in rect: CGRect) {
        let point = CGPoint(
            x: rect.minX + rect.maxX * 110/1000,
            y: rect.minY + rect.maxY * 315/1000
        )
        path.move(to: point)
        path.addCurve(
            to: point,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 20/1000,
                y: rect.minY + rect.maxY * 200/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 10/1000,
                y: rect.minY + rect.maxY * 370/1000
            )
        )
    }

    private func addDrop2(path: inout Path, in rect: CGRect) {
        let point1 = CGPoint(
            x: rect.minX + rect.maxX * 125/1000,
            y: rect.minY + rect.maxY * 345/1000
        )
        path.move(to: point1)

        let point2 = CGPoint(
            x: rect.minX + rect.maxX * 100/1000,
            y: rect.minY + rect.maxY * 390/1000
        )
        path.addCurve(
            to: point2,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 50/1000,
                y: rect.minY + rect.maxY * 340/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 80/1000,
                y: rect.minY + rect.maxY * 440/1000
            )
        )

        path.addQuadCurve(
            to: point1,
            control: CGPoint(
                x: rect.minX + rect.maxX * 110/1000,
                y: rect.minY + rect.maxY * 345/1000
            )
        )
    }

    private func addDrop3(path: inout Path, in rect: CGRect) {
        let point = CGPoint(
            x: rect.minX + rect.maxX * 740/1000,
            y: rect.minY + rect.maxY * 615/1000
        )
        path.move(to: point)
        path.addCurve(
            to: point,
            control1: CGPoint(
                x: rect.minX + rect.maxX * 860/1000,
                y: rect.minY + rect.maxY * 660/1000
            ),
            control2: CGPoint(
                x: rect.minX + rect.maxX * 770/1000,
                y: rect.minY + rect.maxY * 780/1000
            )
        )
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    private struct Preview: View {
        @State private var width: CGFloat = .zero
        @State private var height: CGFloat = .zero
        @State private var animationStep: CGFloat = 1
        @State private var animate: Bool = false

        var body: some View {
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        Splash(animatableData: self.animate ? 0 : self.animationStep)
                            .animation(self.animate
                                ? Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)
                                : .default
                        )
                    }
                    .frame(width: self.width, height: self.height)
                    .border(Color.red)
                    Spacer()
                    HStack {
                        Text("Width")
                        Slider(value: self.$width, in: 0...geometry.size.width)
                    }
                    HStack {
                        Text("Height")
                        Slider(value: self.$height, in: 0...geometry.size.height)
                    }
                    Toggle(isOn: self.$animate) { Text("Animate automatically") }
                    if !self.animate {
                        Text("Animation Step")
                        Slider(value: self.$animationStep, in: 0...1)
                    }
                }.onAppear {
                    self.width = geometry.size.width
                    self.height = geometry.size.height/2
                }
            }.padding()
        }
    }
}

extension Path {
    mutating func addTest(to center: CGPoint) {
        let previous = currentPoint ?? .zero
        addEllipse(in: CGRect(
            x: center.x - 2,
            y: center.y - 2,
            width: 4,
            height: 4
        ))
        move(to: previous)
    }
}
