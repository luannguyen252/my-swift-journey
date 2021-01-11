import SwiftUI

struct Calculator: View {
    // MARK: - Add states here
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing:10){
                Spacer()
                HStack{
                    Spacer()
                    Text("0")
                        .modifier(TitleModifier())
                        .animation(.easeIn(duration: 0.1))
                }
                HStack{
                    Text("C").modifier(ButtonModifier(type: .gray))
                    Text("±").modifier(ButtonModifier(type: .gray))
                    Text("%").modifier(ButtonModifier(type: .gray))
                    Text("÷").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("7").modifier(ButtonModifier(type: .gray))
                    Text("8").modifier(ButtonModifier(type: .gray))
                    Text("9").modifier(ButtonModifier(type: .gray))
                    Text("×").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("4").modifier(ButtonModifier(type: .gray))
                    Text("5").modifier(ButtonModifier(type: .gray))
                    Text("6").modifier(ButtonModifier(type: .gray))
                    Text("-").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("1").modifier(ButtonModifier(type: .gray))
                    Text("2").modifier(ButtonModifier(type: .gray))
                    Text("3").modifier(ButtonModifier(type: .gray))
                    Text("+").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("0").modifier(Zero())
                    Text(".").modifier(ButtonModifier(type: .gray))
                    Text("=").modifier(ButtonModifier(type: .orange))
                }
            }
            .padding()
        }
    }
}

/** # Don't touch this code at all
 This code is to minimize the code you write for each button.
 You create modifiers and add them to each button, and they will all share same modifiers
 */

// 1. Title Modifier: To present the result
struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 120, weight: .thin, design: .default))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
}

// 2. Button Modifier:
struct ButtonModifier: ViewModifier{
    enum `Type`{case gray, orange, zero}
    var type: Type
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(width: type == .zero ? 190 : 80, height: 80)
            .background(self.type == .gray ? Color.gray : Color.orange)
            .clipShape(Circle())
            .foregroundColor(Color.white)
            .padding(2)
    }
}

// 3. Zero Modifier, this view modifier for 0 specifically, where it width is
struct Zero: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .frame(width:  190 , height: 80)
            .background(Color.gray)
            .clipShape(Capsule())
            .foregroundColor(Color.white)
        
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()//.environment(\.colorScheme, .dark)
    }
}
