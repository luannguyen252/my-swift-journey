//
//  FunctionView.swift
//  CalculatorSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct FunctionView: View {
    
    // define some variables
    enum MathFunctions {
        case sinus, cosinus, tangens
        
        func string() -> String {
            switch self {
            case .sinus:
                return "sin"
            case .cosinus:
                return "cos"
            case .tangens:
                return "tan"
            }
        }
        
        func operation(_ input: Double) -> Double {
            switch self {
            case .sinus:
                return sin(input)
            case .cosinus:
                return cos(input)
            case .tangens:
                return tan(input)
            }
        }
    }

    var function: MathFunctions
    @Binding var state: CalculationState
    
    var body: some View {
        return Text(function.string())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(width: 64, height: 64)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.9), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.currentNumber = self.function.operation(self.state.currentNumber)
        }
    }
}
