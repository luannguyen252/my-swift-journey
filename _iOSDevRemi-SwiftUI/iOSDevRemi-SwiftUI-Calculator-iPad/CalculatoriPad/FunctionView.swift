

import SwiftUI

struct FunctionView: View {
    
    enum MathFunction{
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
    
    @Binding var state: CalculationState
    var function: MathFunction
    
    var body: some View {
        return Text(function.string())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.init(.secondarySystemBackground))
            .frame(minWidth: 40, maxWidth: 280, minHeight: 40, maxHeight: 280)


            .background(Color.init(.label))
            .cornerRadius(20)
            .shadow(color: Color.init(.label).opacity(0.2), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.currentNumber = self.function.operation(self.state.currentNumber)
        }
    }
}

//struct FunctionView_Previews: PreviewProvider {
//    static var previews: some View {
//        FunctionView()
//    }
//}
