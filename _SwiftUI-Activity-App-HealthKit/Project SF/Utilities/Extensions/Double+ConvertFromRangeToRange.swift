import Foundation

extension Double {
    public func convert(fromRange: ClosedRange<Double>, toRange: ClosedRange<Double>) -> Double {
        var value = self
        value -= fromRange.lowerBound
        value /= Double(fromRange.upperBound - fromRange.lowerBound)
        value *= toRange.upperBound - toRange.lowerBound
        value += toRange.lowerBound
        return value
    }
}
