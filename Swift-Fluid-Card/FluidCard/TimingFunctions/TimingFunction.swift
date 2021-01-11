public struct TimingFunction {
    // MARK: - Properties
    var controlPoint1: CGPoint {
        didSet { updateUnitBezier() }
    }

    var controlPoint2: CGPoint {
        didSet { updateUnitBezier() }
    }

    var duration: CGFloat {
        didSet { updateEpsilon() }
    }

    // MARK: - Private Properties
    private var unitBezier: UnitBezier
    private var epsilon: CGFloat

    // MARK: - Initialiser
    public init(controlPoint1: CGPoint, controlPoint2: CGPoint, duration: CGFloat = 1.0) {
        self.controlPoint1 = controlPoint1
        self.controlPoint2 = controlPoint2
        self.duration = duration
        self.unitBezier = .init(controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        self.epsilon = TimingFunction.epsilon(for: duration)
    }

    // MARK: - Public API
    /// Returns the progress along the timing function for the given time (`fractionComplete`)
    /// with `0.0` equal to the start of the curve, and `1.0` equal to the end of the curve
    func progress(at fractionComplete: CGFloat) -> CGFloat {
        return unitBezier.value(for: fractionComplete, epsilon: epsilon)
    }

    // MARK: - Private helpers
    mutating private func updateUnitBezier() {
        unitBezier = UnitBezier(controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    }

    mutating private func updateEpsilon() {
        epsilon = TimingFunction.epsilon(for: duration)
    }
}

// MARK: - Static methods
private extension TimingFunction {
    static func epsilon(for duration: CGFloat) -> CGFloat {
        return CGFloat(1.0 / (200.0 * duration))
    }
}

// MARK: - Platform specific extensions
#if canImport(UIKit)
import UIKit

public extension TimingFunction {
    init(timingParameters: UICubicTimingParameters, duration: CGFloat = 1.0) {
        self.init(
            controlPoint1: timingParameters.controlPoint1,
            controlPoint2: timingParameters.controlPoint2,
            duration: duration
        )
    }
}
#endif
