import UIKit

extension CACornerMask {
    static var all: CACornerMask {
        return [.layerMinXMinYCorner,
                .layerMaxXMinYCorner,
                .layerMaxXMaxYCorner,
                .layerMinXMaxYCorner]
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat = 0, dy: CGFloat = 0) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
