import SwiftUI

struct VisualEditorInXcode_: View {
    var body: some View {
        VStack {
            // 1. Inspector
            Text("SwiftUI for iOS 14")
                .font(.title2)
                .fontWeight(.bold)
            
            // 2. Insert Menu
            VStack(spacing: 8.0) {
                Circle()
                    .frame(width: 44.0, height: 44.0)
                Text("SwiftUI for iOS 14")
                    .font(.title)
                    .fontWeight(.bold)
                Text("20 videos")
            }
            
            // 3. Modifiers
            VStack(alignment: .center, spacing: 8.0) { }
                .padding(.all)
                .background(Color.blue)
                .cornerRadius(20.0)
            
            // 4. Final Code
            VStack(alignment: .center, spacing: 8.0) {
                Circle()
                    .frame(width: 44.0, height: 44.0)
                Text("SwiftUI for iOS 14")
                    .font(.title)
                    .fontWeight(.bold)
                Text("20 videos")
            }
            .padding(.all)
            .background(Color.blue)
            .cornerRadius(20.0)
        }
    }
}

#if DEBUG
struct VisualEditorInXcode__Previews: PreviewProvider {
    static var previews: some View {
        VisualEditorInXcode_()
    }
}
#endif
