

import SwiftUI

struct ContentView: View {
    
    @State var state =  CalculationState()
    
   
    @State var isPlusOnScreen = false
    @State var isPlusOnScreen1 = false
    @State var isPlusOnScreen2 = false
    @State var isPlusOnScreen3 = false
    @State var isPlusOnScreen4 = false
    @State var isPlusOnScreen5 = false
    
    @State var userIsInTheMiddleOfTypping = false
    @State var display = "0"
    
    
    var displayedString: String {
        return String(format: "%.1f", arguments: [state.currentNumber])
    }
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color("Start"), Color("Middle"), Color("End")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .trailing) {
               
                    MenuView()
  
                
                Text(displayedString)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .lineLimit(1)

                
                HStack{
                    
                    FunctionView(state: $state, function: .cosinus)
                      

                    
                    FunctionView(state: $state, function: .sinus)
                                        
                    
                    FunctionView(state: $state, function: .tangens)
                    
                    
                    
                    ActionView(action: .multiply, state: $state)
                        .offset(y: isPlusOnScreen ? 0 : 1100)
                        .animation(.spring(dampingFraction: 0.6))
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                                self.isPlusOnScreen.toggle()
                            }
                    }

                }
                
                HStack{
                    NumberView(number: 7, state: $state)
                    
                     
                   
                    NumberView(number: 8, state: $state)
                      
     
                    
                    NumberView(number: 9, state: $state)
                    

                    
                   ActionView(action: .divide, state: $state)
                    .offset(y: isPlusOnScreen1 ? 0 : 1100)
                    .animation(.spring(dampingFraction: 0.6))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            self.isPlusOnScreen1.toggle()
                        }
                    }
                    
                }
                
                HStack{
                    NumberView(number: 4, state: $state)

                    NumberView(number: 5, state: $state)
                    
                    NumberView(number: 6, state: $state)

                    ActionView(action: .plus, state: $state)
                    .offset(y: isPlusOnScreen2 ? 0 : 1100)
                    .animation(.spring(dampingFraction: 0.6))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            self.isPlusOnScreen2.toggle()
                        }
                    }
                }
                
                HStack{
                    NumberView(number: 1, state: $state)

                    NumberView(number: 2, state: $state)
                    
                    NumberView(number: 3, state: $state)
                     

                    ActionView(action: .minus, state: $state)
                    .offset(y: isPlusOnScreen3 ? 0 : 1100)
                    .animation(.spring(dampingFraction: 0.6))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            self.isPlusOnScreen3.toggle()
                        }
                    }
                }
                
                HStack {
                    ActionView(action: .clear, state: $state)

                    NumberView(number: 0, state: $state)

                    NumberView(number: .pi, state: $state)
//                    Button(action: {
//                        self.performOperation(".")
//                    }) {
//                        Text(".")
//                        .frame(minWidth: 50, idealWidth: 80, maxWidth: 150, minHeight: 50, idealHeight: 80, maxHeight: 150)
//                    }

                   ActionView(action: .equal, state: $state)
                    .offset(y: isPlusOnScreen4 ? 0 : 1100)
                    .animation(.spring(dampingFraction: 0.6))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.isPlusOnScreen4.toggle()
                        }
                    }
                   
                }
                
                
            }
    .padding(25)
           
        }
    }
    
    func touchDegit(_ digit: String){
        if userIsInTheMiddleOfTypping {
            display+=digit
        }else{
            display = digit
            userIsInTheMiddleOfTypping = true
        }
    }
    
    func performOperation(_ symbol:String) {
        if Double(symbol) != nil || symbol == "."{
            touchDegit(symbol)
        }
        
    }
  

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            
           ContentView()
            .previewDevice("iPad Pro")
            .environment(\.colorScheme, .light)
//            .navigationViewStyle(.doubleColumn)
            
            ContentView()
            .previewDevice("iPad Pro")
            .environment(\.colorScheme, .dark)
        }
    }
}
