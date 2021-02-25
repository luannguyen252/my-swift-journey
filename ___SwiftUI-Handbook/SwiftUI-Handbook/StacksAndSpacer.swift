import SwiftUI

struct StacksAndSpacer: View {
    var body: some View {
        // VStack
        VStack(alignment: .leading, spacing: 16) {
            Text("Hello, world!")
                .font(.title)
            Spacer()
            Text("Second line")
        }
        
        // HStack
        HStack(alignment: .bottom, spacing: 16) {
            Text("Hello, world!")
                .font(.title)
            Spacer()
            Text("Second line")
        }
        
        // Spacer
        HStack(alignment: .bottom, spacing: 16) {
            Text("Hello, world!")
                .font(.title)
            Spacer()
            Text("Second line")
        }
        .padding()
        .frame(width: 320)
        
        // ZStack
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(.blue)
            Text("Hello, world!")
                .font(.title)
            Spacer()
            Text("Second line")
        }
        .padding()
        .frame(width: 320)
    }
}

#if DEBUG
struct StacksAndSpacer_Previews: PreviewProvider {
    static var previews: some View {
        StacksAndSpacer()
    }
}
#endif
