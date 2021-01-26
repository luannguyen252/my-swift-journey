import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equal, plus, minus, multiply, divide
    case clear, space
    
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
            case .divide: return "÷"
            case .multiply: return "×"
            case .minus: return "-"
            case .plus: return "+"
            case .decimal: return "."
            case .equal: return "="
            case .space: return ""
            default:  return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal: return Color(.darkGray)
            case .clear: return Color(.lightGray)
            case .space: return Color(.black)
            default: return .orange
        }
    }
    
}

class GlobalEnvironment: ObservableObject {
    @Published var display = "000"
    
    func receiveInput(calculatorButton: CalculatorButton) {
        self.display = calculatorButton.title
    }
}

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    static let buttons: [[CalculatorButton]] = [
        [.clear, .space, .divide],
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],
        [.zero, .decimal]
    ]
    
    static let operators: [CalculatorButton] = [.multiply, .minus, .plus, .equal]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 64))
                }
                .padding()
            
                HStack(spacing: 12) {
                    VStack(spacing: 12) {
                        ForEach(ContentView.buttons, id: \.self){ row in
                            HStack(spacing: 12) {
                                ForEach(row, id: \.self){ button in
                                    CalculatorButtonView(button: button)
                                }
                            }
                        }
                    }
                    VStack(spacing: 12) {
                        ForEach(ContentView.operators, id: \.self){ button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    struct CalculatorButtonView: View {
        var button: CalculatorButton

        @EnvironmentObject var env: GlobalEnvironment
        
        var buttonHeight: CGFloat {
            if button == .equal {
                return (UIScreen.main.bounds.width - 4 * 12) / 2
            } else {
                return (UIScreen.main.bounds.width - 5 * 12) / 4
            }
        }
        
        var body: some View {
            Button(action: {
                self.env.receiveInput(calculatorButton: self.button)
            }) {
                Text(button.title)
                .font(.system(size: 32))
                    .frame(width: self.buttonWidth(button: button), height: buttonHeight)
                    .foregroundColor(.white)
                    .background(button.backgroundColor)
                    .cornerRadius(self.buttonWidth(button: button))
            }
        }
        
        private func buttonWidth(button: CalculatorButton) -> CGFloat {
            if button == .zero {
                return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
            }
            
            return (UIScreen.main.bounds.width - 5 * 12) / 4
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
