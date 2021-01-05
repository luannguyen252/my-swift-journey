import Foundation

precedencegroup BrokenAdditionPrecedence {
    associativity: right
    higherThan: RangeFormationPrecedence
}

//infix operator - : BrokenAdditionPrecedence
print(10 - 5 - 1)  // This SHOULD be 4, but will be 6 if we uncomment the above infix setting



//////////////// Adding to Existing Operators ////////////////

func * (lhs: [Int], rhs: [Int]) -> [Int] {
    guard lhs.count == rhs.count else {
        preconditionFailure("Arrays must be the same size")
    }
    
    return (0..<lhs.count).map { lhs[$0] * rhs[$0] }
}

print([1, 2, 4] * [2, 3, 9])



//////////////// Adding New Operators ////////////////


precedencegroup ExponentiationPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: right
}

infix operator ** : ExponentiationPrecedence

func ** (base: Double, power: Double) -> Double {
    return pow(base, power)
}

print(2 ** 8)
print(2 ** 8 + 2)
print(2 ** 8 ** 2)


//////////////// Modifying Existing Operators ////////////////

/**
 We want the Closed Range Operator (...) to take three numbers.
 
 For example: 1...10...1 should produce:
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
 */


precedencegroup RangeFormationPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator ... : RangeFormationPrecedence


func ... (lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
    let leftItems = Array(lhs)
    let rightItems = (rhs ..< lhs.upperBound).reversed()

    return leftItems + rightItems
}



print(1...10...1)

