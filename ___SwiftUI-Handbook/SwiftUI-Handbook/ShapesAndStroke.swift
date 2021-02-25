import SwiftUI

struct ShapesAndStroke: View {
    var body: some View {
        // Circle
        Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: 44, height: 44)
        
        // Ellipse
        Ellipse()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: 44, height: 88)
        
        // Rectangle
        Rectangle()
            .foregroundColor(.blue)
            .ignoresSafeArea()
        
        // RoundedRectangle
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .fill(Color.green)
            .frame(height: 44)
            .overlay(Text("Sign up").bold())
        
        // Capsule
        Capsule()
            .fill(Color.green)
            .frame(height: 44)
            .overlay(Text("Sign up").bold())
        
        // Final Layout
        ZStack {
            Rectangle()
                .fill(Color.blue).ignoresSafeArea()

            VStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 44, height: 44)
                Text("Meng To").bold()
                Capsule()
                    .foregroundColor(Color.green)
                    .frame(height: 44)
                    .overlay(Text("Sign up"))
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding()
        }
    }
}

#if DEBUG
struct ShapesAndStroke_Previews: PreviewProvider {
    static var previews: some View {
        ShapesAndStroke()
    }
}
#endif
