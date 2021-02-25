import SwiftUI

struct ColorLiteralAndImageLiteral: View {
    var body: some View {
        // Color Literal
        // Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        
        // Image Literal
        // Image(uiImage: #imageLiteral(resourceName: "YOUR-IMAGE"))
        Image(uiImage: #imageLiteral(resourceName: "mac1"))
        
        // Final Layout
        VStack {
            Text("Color literal")
                .font(.title).bold()
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        }
        .frame(width: 300, height: 200)
        .background(Image(uiImage: #imageLiteral(resourceName: "mac1")).resizable().aspectRatio(contentMode: .fill))
        .cornerRadius(20)
    }
}

#if DEBUG
struct ColorLiteralAndImageLiteral_Previews: PreviewProvider {
    static var previews: some View {
        ColorLiteralAndImageLiteral()
    }
}
#endif
