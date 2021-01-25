//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by park kyung suk on 2020/06/10.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, dot
    case equals, plus, minus, multiply, divide
    case ac, pulsMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
            
        case .percent: return "%"
        case .minus: return "-"
        case .plus: return "+"
        case .pulsMinus: return "±"
        case .multiply: return "X"
        case .equals: return "="
        case .dot: return "."
            
        default:
            return "AC"
            
        }
    }
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .ac, .pulsMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.orange)
        }
    }
}

// treat - 扱う
// You can treat this as the Global Application State
class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton) {
        self.display = calculatorButton.title
    }
    
}

struct ContentView: View {

    @EnvironmentObject var env: GlobalEnvironment

    let buttons: [[CalculatorButton]] = [
        [.ac, .pulsMinus, .percent, .divide],
        [.seven, .eight, .nine, .minus],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 72))
                }.padding()
                
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
  
}

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        
        Button(action: {
            self.env.receiveInput(calculatorButton: self.button)
        }) {
            Text(button.title)
            .font(.system(size: 32))
            .frame(width: self.buttonWidth(button: button), height: self.buttonHeight(), alignment: .center)
            .foregroundColor(.white)
            .background(button.backgroundColor)
            .cornerRadius(self.buttonWidth(button: button))
        }
    }
    
    func buttonHeight() -> CGFloat {
          80
      }
      
      func buttonWidth(button: CalculatorButton) -> CGFloat {
          if button == .zero {
              return (UIScreen.main.bounds.width - 3 * 12) / 4 * 2
          }
          // 5はボタン間のスペースの数　margin == 12 * spacing == 5
          return (UIScreen.main.bounds.width - 5 * 12) / 4
             }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
