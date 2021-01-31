import SwiftUI

struct TextShimmer: View {
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 56, weight: .heavy, design: .default))
                .foregroundColor(Color(.white).opacity(0.25))
                
            HStack(spacing: 0) {
                ForEach(0 ..< text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 56, weight: .heavy, design: .default))
                         .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5), Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(16)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                    animation.toggle()
                }
            })
            .preferredColorScheme(.dark)
        }
    }
    
    func randomColor() -> Color {
         let color = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return Color(color)
    }
}
