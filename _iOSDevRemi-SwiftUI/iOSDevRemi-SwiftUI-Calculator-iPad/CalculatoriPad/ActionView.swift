

import SwiftUI

struct ActionView: View {
    
    enum Action {
        case equal, clear, plus, minus, multiply, divide
        
        func image() -> Image {
            switch self {
            case .equal:
                return Image(systemName: "equal")
            case .clear:
                return Image(systemName: "xmark.circle")
            case .plus:
                 return Image(systemName: "plus")
            case .minus:
                 return Image(systemName: "minus")
            case .multiply:
                 return Image(systemName: "multiply")
            case .divide:
                 return Image(systemName: "divide")
//                case .point:
//                return Image(systemName: "smallcircle.circle")
            }
           
        }
        
        func calculate(_ input1: Double, _ input2: Double) -> Double?{
            switch self {
            case .plus:
                return input1 + input2
            case .minus:
                return input1 - input2
            case .multiply:
                return input1 * input2
            case .divide:
                return input1 / input2
             
            default:
                return nil
            }
        }
        
        
    }
    
    let action: Action
    @Binding var state: CalculationState
    
    var body: some View {
        action.image()
            .font(Font.title.weight(.bold))
            .foregroundColor(.white)
             .frame(minWidth: 40, maxWidth: 280, minHeight: 40, maxHeight: 280)

            .background(Color.init(.systemIndigo))
            .cornerRadius(20)
            .shadow(color: Color.init(.systemIndigo).opacity(0.3), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.tapped()
        }
    }
    
    
     func tapped() {
        switch action {
        case .clear:
            state.currentNumber = 0
            state.storedNumber = nil
            state.storeAction = nil
            break
        case .equal:
            guard let storedAction = state.storeAction else {
                return
            }
            
            guard let storeNumber = state.storedNumber else {
                return
            }
            
            guard let result = storedAction.calculate(storeNumber, state.currentNumber) else{
                return
            }
            
            state.currentNumber = result
            state.storedNumber = nil
            state.storeAction = nil
            
            break
            
        default:
            
            state.storedNumber = state.currentNumber
            state.currentNumber = 0
            state.storeAction = action
            break
        }
    }
    
}

//struct ActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionView()
//    }
//}
