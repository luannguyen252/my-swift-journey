//
//  NumberView.swift
//  CalculatorSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct NumberView: View {
    
    // define some variables
    let number: Double
    var numberString: String {
        if number == Double.pi {
            return "π"
        }
        else if number == .myNumber {
            return "N"
        }
        return String(Int(number))
    }
    @Binding var state: CalculationState
    
    var body: some View {
        Text(numberString)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.appendNumber(self.number)
        }
    }
}

extension Double {
    static let myNumber: Double = 1.2345
}
