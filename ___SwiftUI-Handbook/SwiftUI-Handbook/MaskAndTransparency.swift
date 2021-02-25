import SwiftUI

struct MaskAndTransparency: View {
    var body: some View {
        // Transparency Mask
        VStack {
            Text("Mask and Transparency")
                .font(.title3).bold()
        }
        .padding()
        .background(Color.blue)
        .mask(Color.black.opacity(0.3))
        
        // Alpha Gradient Mask
        .mask(
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
        )
        
        // Final Layout
        MaskAndTransparencyFinalLayout()
    }
}

// Final Layout
struct MaskAndTransparencyFinalLayout: View {
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack {
                    ForEach(0 ..< 5) { item in
                        Text("Mask and Transparency")
                            .font(.title3).bold()
                            .padding(.vertical)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                    }
                }
                .frame(height: 300, alignment: .top)
                .padding()
                .background(Color.white)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(30)
                .padding()
            }
    }
}

#if DEBUG
struct MaskAndTransparency_Previews: PreviewProvider {
    static var previews: some View {
        MaskAndTransparency()
    }
}
#endif
