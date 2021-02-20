/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A single line in the graph.
 */

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>

    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: self.range) / magnitude(of: self.overallRange)), 0.15)
    }

    var offsetRatio: CGFloat {
        CGFloat((self.range.lowerBound - self.overallRange.lowerBound) / magnitude(of: self.overallRange))
    }

    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 150, range: 10 ..< 50, overallRange: 0 ..< 100)
    }
}
