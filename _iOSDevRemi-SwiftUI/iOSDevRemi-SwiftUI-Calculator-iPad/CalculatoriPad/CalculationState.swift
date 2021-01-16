

import SwiftUI

struct CalculationState {
    
    var currentNumber: Double = 0
    
    var storedNumber: Double?
    var storeAction: ActionView.Action?
    
   mutating func appendNumber(_ number: Double) {
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
        }else{
            currentNumber = number
    }
    
    }
    
    
}

//struct CalculationState_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculationState()
//    }
//}
