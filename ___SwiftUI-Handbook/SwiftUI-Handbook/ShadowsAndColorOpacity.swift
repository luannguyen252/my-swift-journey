import SwiftUI

struct ShadowsAndColorOpacity: View {
    var body: some View {
        // Default Shadow
        RoundedRectangle(cornerRadius: 25)
            .shadow(radius: 10)
        
        // Custom Shadow and Opacity
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        
        // Multiple Shadows
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
        
        // Text Shadow
        Text("App of the day")
            .font(.title).bold()
            .foregroundColor(.white)
            .shadow(radius: 20)
        
        // Color Shadow
            .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
        
        // Final Layout
        VStack {
            Text("App of the day")
                .font(.title).bold()
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300, height: 400)
        .background(Color.pink)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

#if DEBUG
struct ShadowsAndColorOpacity_Previews: PreviewProvider {
    static var previews: some View {
        ShadowsAndColorOpacity()
    }
}
#endif
