//
//  AnimatableVector.swift
//  Music

//  usage and explanation at: https://nerdyak.tech/development/2020/01/12/animating-complex-shapes-in-swiftui.html
//
//  Created by Clifton on 2021-01-18.
//

import SwiftUI

struct AnimatableVector: VectorArithmetic {
    
    var values: [Double]
    
    init(count: Int = 1) {
        self.values = [Double](repeating: 0.0, count: count)
        self.magnitudeSquared = 0.0
    }
    
    init(with values: [Double]) {
        self.values = values
        self.magnitudeSquared = 0
        self.recomputeMagnitude()
    }
    
    func computeMagnitude()->Double {
        // compute square magnitued of the vector
        // = sum of all squared values
        var sum: Double = 0.0
        
        for index in 0..<self.values.count {
            sum += self.values[index]*self.values[index]
        }
        
        return Double(sum)
    }
    
    mutating func recomputeMagnitude(){
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: VectorArithmetic
    var magnitudeSquared: Double // squared magnitude of the vector
    
    mutating func scale(by rhs: Double) {
        // scale vector with a scalar
        // = each value is multiplied by rhs
        for index in 0..<values.count {
            values[index] *= rhs
        }
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: AdditiveArithmetic
    
    // zero is identity element for aditions
    // = all values are zero
    static var zero: AnimatableVector = AnimatableVector()
    
    static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] + rhs.values[index])
        }
        
        return AnimatableVector(with: retValues)
    }
    
    static func += (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index] += rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }

    static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] - rhs.values[index])
        }
        
        return AnimatableVector(with: retValues)
    }
    
    static func -= (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index] -= rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }
}
