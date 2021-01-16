

import SwiftUI

struct NumberView: View {
    
    let number: Double
//    let point: String
    
    @Binding var state: CalculationState
    
    var numberString: String{
        if number == .pi {
            return "π"
        }
//        else if point == .myPoint{
//            return "."
//        }
        
        
        

        
       return String(Int(number))
    }
    
    var body: some View {
        Text(numberString)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
        
             .frame(minWidth: 40, maxWidth: 280, minHeight: 40, maxHeight: 280)
            .background(Color.gray)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.appendNumber(self.number)
        }
    }
}

extension String {
    static let myPoint: String = "."
}



//struct NumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NumberView(number: 1, state: )
//            .previewDevice("iPad Pro")
//        }
//    }
//}
