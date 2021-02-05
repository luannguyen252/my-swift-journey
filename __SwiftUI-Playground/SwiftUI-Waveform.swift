import SwiftUI

struct ContentView: View {
    @State private var showSmallest = false
    @State private var showSmaller = false
    @State private var showSmall = false
    @State private var showLarge = false
    @State private var showLarger = false
    @State private var showLargest = false
    @State private var showCentral = false
    
    var body: some View {
        ZStack {
            Circle() // Largest
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.6503022313, green: 0.4740011692, blue: 0.4985639453, alpha: 1)))
                .scaleEffect(showLargest ? 4 : 0.5)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showLargest.toggle()
                }
            
            Circle() // Larger
                .frame(width: 250, height: 250, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.6717726588, green: 0.51033777, blue: 0.57929492, alpha: 1)))
                .scaleEffect(showLarger ? 1 : 0.5)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showLarger.toggle()
                }
            
            Circle() // Large
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.6338826418, green: 0.349599123, blue: 0.4321095943, alpha: 1)))
                .scaleEffect(showLarge ? 4 : 0.5)
                .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showLarge.toggle()
                }
            
            Circle() // Small
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.5348948836, green: 0.2363169491, blue: 0.3430256546, alpha: 1)))
                .opacity(showSmall ? 4 : 0.1)
                .scaleEffect(showSmall ? 1 : 0.5)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showSmall.toggle()
                }
            
            Circle() // Smaller
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.5177612305, green: 0.1702933908, blue: 0.2867953777, alpha: 1)))
                .opacity(showSmaller ? 1 : 0.1)
                .scaleEffect(showSmaller ? 4 : 0.5)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showSmaller.toggle()
                }
            
            Circle() // Smallest
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.4813516736, green: 0.1270372272, blue: 0.2556577921, alpha: 1)))
                .opacity(showSmallest ? 1 : 0.1)
                .scaleEffect(showSmallest ? 4 : 0.5)
                .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                .onAppear(){
                    showSmallest.toggle()
                }
            
            Circle()
                .frame(width: 12.5, height: 12.5, alignment: .center)
                .opacity(showCentral ? 1 : 0.1)
                .scaleEffect(showCentral ? 1 : 0.8)
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear(){
                    showCentral.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
