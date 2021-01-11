import CoreGraphics

public struct UnitBezier {
    // MARK: - Properties
    private let ax: CGFloat
    private let bx: CGFloat
    private let cx: CGFloat

    private let ay: CGFloat
    private let by: CGFloat
    private let cy: CGFloat

    // MARK: - Initialiser
    public init(controlPoint1: CGPoint, controlPoint2: CGPoint) {
        // Calculate the polynomial coefficients, implicit first
        // and last control points are (0,0) and (1,1).
        cx = 3.0 * controlPoint1.x
        bx = 3.0 * (controlPoint2.x - controlPoint1.x) - cx
        ax = 1.0 - cx - bx

        cy = 3.0 * controlPoint1.y
        by = 3.0 * (controlPoint2.y - controlPoint1.y) - cy
        ay = 1.0 - cy - by
    }

    // MARK: - Methods
    func value(for x: CGFloat, epsilon: CGFloat) -> CGFloat {
        return sampleCurveY(solveCurveX(x, epsilon: epsilon))
    }

    func sampleCurveX(_ t: CGFloat) -> CGFloat {
        // `ax t^3 + bx t^2 + cx t' expanded using Horner's rule.
        return ((ax * t + bx) * t + cx) * t
    }

    func sampleCurveY(_ t: CGFloat) -> CGFloat {
        return ((ay * t + by) * t + cy) * t
    }

    func sampleCurveDerivativeX(_ t: CGFloat) -> CGFloat {
        return (3.0 * ax * t + 2.0 * bx) * t + cx
    }

    // Given an x value, find a parametric value it came from.
    func solveCurveX(_ x: CGFloat, epsilon: CGFloat) -> CGFloat {
        var t0, t1, t2, x2, d2: CGFloat

        // First try a few iterations of Newton's method -- normally very fast.
        t2 = x
        for _ in (0..<8) {
            x2 = sampleCurveX(t2) - x
            guard abs(x2) >= epsilon else { return t2 }
            d2 = sampleCurveDerivativeX(t2)
            guard abs(d2) >= 1e-6 else { break }
            t2 = t2 - x2 / d2
        }

        // Fall back to the bisection method for reliability.
        t0 = 0.0
        t1 = 1.0
        t2 = x

        guard t2 >= t0 else { return t0 }
        guard t2 <= t1 else { return t1 }

        while t0 < t1 {
            x2 = sampleCurveX(t2)

            guard abs(x2 - x) >= epsilon else { return t2 }

            if x > x2 {
                t0 = t2
            } else {
                t1 = t2
            }

            t2 = (t1 - t0) * 0.5 + t0
        }

        // Failure
        return t2
    }
}
