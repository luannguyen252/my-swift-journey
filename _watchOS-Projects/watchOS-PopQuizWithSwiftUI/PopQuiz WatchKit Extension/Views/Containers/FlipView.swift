/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The flip view container applies a 3D horizontal rotation effect to two views.
*/

import SwiftUI

struct FlipView<Front: View, Back: View> : View {
    let front: Front
    let back: Back

    init(_ front: Front, _ back: Back) {
        self.front = front
        self.back = back
    }

    var body: some View {
        GeometryReader {
            FlipContent(front: self.front, back: self.back, size: $0.size)
        }
        .frame(height: 120.0)
    }
}

/**
 The FlipContent view applies a 3D rotation effect to the view when it is either
 tapped or dragged. To achieve the desired effect of the card having both a
 "front" and "back", when the view reaches 90 degrees of rotation the "front"
 view becomes translucent and the "back" view becomes opaque. This allows for
 seamlessly switching between the two views during the animation.
 */
private struct FlipContent<Front: View, Back: View> : View {
    let front: Front
    let back: Back
    let size: CGSize

    @State var angleState = TranslatingAngleState()

    var body: some View {
        ZStack(alignment: .center) {
            front
                .opacity(angleState.showingFront ? 1.0 : 0.0)
            back
                .scaleEffect(CGSize(width: -1.0, height: 1.0))
                .opacity(angleState.showingFront ? 0.0 : 1.0)
        }
        .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .center)
        .rotation3DEffect(.degrees(angleState.total), axis: (0.0, 1.0, 0.0), perspective: 0.5)
        .onTapGesture {
            var currentState = self.angleState
            currentState.angle -= 180.0
            currentState.angleTranslation = 0.0
            withAnimation {
                self.angleState = currentState
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0.0, coordinateSpace: .local)
                .onChanged { value in
                    let angle = Double((value.translation.width / self.size.width)) * 180.0
                    self.angleState.angleTranslation = angle
                }
                .onEnded { value in
                    let endAngle = Double((value.predictedEndTranslation.width / self.size.width)) * 180.0
                    let animation = self.$angleState.animation(.spring())

                    var currentState = self.angleState
                    if endAngle >= 90.0 {
                        currentState.angle += 180.0
                    } else if endAngle < -90.0 {
                        currentState.angle -= 180.0
                    }

                    currentState.angleTranslation = 0.0
                    animation.wrappedValue = currentState
                }
        )
    }
}

struct TranslatingAngleState {
    var angle: Double = 0.0
    var angleTranslation: Double = 0.0

    var total: Double {
        angle + angleTranslation
    }

    var clamped: Double {
        var clampedAngle = angleTranslation + angle
        while clampedAngle < 360.0 {
            clampedAngle += 360.0
        }
        return clampedAngle.truncatingRemainder(dividingBy: 360.0)
    }

    var showingFront: Bool {
        let clampedAngle = clamped
        return clampedAngle < 90.0 || clampedAngle > 270.0
    }
}
