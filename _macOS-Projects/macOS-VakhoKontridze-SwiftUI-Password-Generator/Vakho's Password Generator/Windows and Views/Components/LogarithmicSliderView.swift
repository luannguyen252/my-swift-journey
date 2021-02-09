//
//  LogarithmicSliderView.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/30/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Logarithmic Slider View
struct LogarithmicSliderView: View {
    // MARK: Properties
    @Binding private var value: Int
    private let range: ClosedRange<Int>
    
    // MARK: Initializers
    init(value: Binding<Int>, range: ClosedRange<Int>) {
        self._value = value
        self.range = range
    }
}

// MARK: Body
extension LogarithmicSliderView {
    var body: some View {
        slider
            .background(tickMarks)
    }
    
    var slider: some View {
        Slider(
            value: .init(
                get: { Double(value.normalized(on: range)) },
                set: { value = $0.denormalized(on: range) }
            ),
            in: range.normalized
        )
    }
    
    var tickMarks: some View {
        HStack(spacing: 0, content: {
            ForEach(range.normalized.asSliderRange, content: { section in
                HStack(spacing: 0, content: {
                    tickMark(Double(section).denormalized(on: range))
                    Spacer()
                })
            })
            self.tickMark(range.upperBound)
        })
            .padding(.horizontal, 7.5)
    }
    
    func tickMark(_ section: Int) -> some View {
        Rectangle()
            .frame(width: 2, height: 4)
            .padding(.top, 10)

            .foregroundColor(value >= section ? .accentColor : .secondary)
    }
}

// MARK:- Normalization
private extension Int {
    func normalized(on range: ClosedRange<Int>) -> Double {
        // 5 = log(128)/log(2) - log(8)/log(2) + 1
        guard range.contains(self) else { return 0 }
        return log2(.init(self)) - log2(.init(range.lowerBound)) + 1
    }
}

private extension ClosedRange where Bound == Int {
    var normalized: ClosedRange<Double> {
        // 8 16 32 64 128 256 512 1024
        // 1 2  3  4  5   6   7   8
        1...(log2(.init(upperBound)) - log2(.init(lowerBound)) + 1)
    }
}

// MARK:- Denormalization
private extension Double {
    func denormalized(on range: ClosedRange<Int>) -> Int {
        // 128 = (8/2) * e ^ (5 * ln(2))
        guard range.normalized.contains(self) else { return 0 }
        return .init(( (Double(range.lowerBound)/2) * pow(.e, self*log(2)) ).rounded())
    }
}

// MARK: Helpers
private extension Double {
    static var e: Double {
        2.71828182845904523536028747135266249775724709369995
    }
}

private extension ClosedRange where Bound == Double {
    var asSliderRange: Range<Int> {
        .init(Int(lowerBound)...Int(upperBound-1))
    }
}
        
// MARK: Preview
struct LogarithmicSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LogarithmicSliderView(value: .constant(16), range: SettingsViewModel.lengthRange)
    }
}
