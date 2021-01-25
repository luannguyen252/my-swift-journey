//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct CalculationState {
    var currentNumber: Double = 0
    
    var storedNumber: Double?
    var storedAction: ActionView.Action?
    
    mutating func appendNumber(_ number: Double) {
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
            print("The current number is: \(currentNumber)")
        }
        else {
            currentNumber = number
        }
    }
}

struct ContentView: View {
    
    // define some variables
    @State var state = CalculationState()
    private var displayString: String {
        return String(format: "%.2f", state.currentNumber)
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            Spacer()
            Text(displayString)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(3)
                .padding(.bottom, 64)
            
            HStack {
                FunctionView(function: .cosinus, state: $state)
                Spacer()
                FunctionView(function: .sinus, state: $state)
                Spacer()
                FunctionView(function: .tangens, state: $state)
                Spacer()
                ActionView(action: .multiply, state: $state)
            }
            
            HStack {
                NumberView(number: 7, state: $state)
                Spacer()
                NumberView(number: 8, state: $state)
                Spacer()
                NumberView(number: 9, state: $state)
                Spacer()
                ActionView(action: .divide, state: $state)
            }
            
            HStack {
                NumberView(number: 4, state: $state)
                Spacer()
                NumberView(number: 5, state: $state)
                Spacer()
                NumberView(number: 6, state: $state)
                Spacer()
                ActionView(action: .plus, state: $state)
            }
            
            HStack {
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                ActionView(action: .minus, state: $state)
            }
            
            HStack {
                ActionView(action: .clear, state: $state)
                Spacer()
                NumberView(number: 0, state: $state)
                Spacer()
                NumberView(number: .pi, state: $state)
                Spacer()
                ActionView(action: .equal, state: $state)
            }
            
        }.padding(32)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
