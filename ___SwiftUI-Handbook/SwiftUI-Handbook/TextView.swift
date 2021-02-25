import SwiftUI

struct TextView: View {
    var body: some View {
        // Text View
        Text("My first app")
        
        // Changing the Font
        Text("San Francisco")
            .font(.title)
        
        // System Fonts
        Text("New York")
           .fontWeight(.bold)
           .font(.system(size: 12, weight: .light, design: .serif))
        
        // Font Weight
            .fontWeight(.bold)
        
        // Italic
            .italic()
        
        // Change Font Color
        Text("London Calling")
            .foregroundColor(.secondary)
        
        // Dimension and alignment
        Text("This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.")
            .frame(width: 100, alignment: .leading)
        
        // Multiline Text Alignment
            .multilineTextAlignment(.center)
        
        // Line Limit
        Text("This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.")
            .frame(width: 100)
            .lineLimit(1)
        
        // Line Spacing
            .lineSpacing(10)
    }
}

#if DEBUG
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
#endif
