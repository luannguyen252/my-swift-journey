import SwiftUI

struct WaveShapeExample: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                // Top View

                GeometryReader { geo in
                    ZStack {
                        Wave(waveHeight: 30, phase: Angle(degrees: (Double(geo.frame(in: .global).minY) + 45) * -1 * 0.7))
                            .foregroundColor(.orange)
                            .opacity(0.5)
                        Wave(waveHeight: 30, phase: Angle(degrees: Double(geo.frame(in: .global).minY) * 0.7))
                            .foregroundColor(.red)
                    }
                }
                .frame(height: 70, alignment: .center)

                // Bottom View
            }
        }
    }
}

#if DEBUG
struct WaveShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        WaveShapeExample()
    }
}
#endif
