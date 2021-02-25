import SwiftUI

struct MaxWidthAndFrameAlignment: View {
    var body: some View {
        // Stacks and Spacer Alternatives
        VStack {
            HStack {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .background(Circle().stroke())
                Spacer()
            }
            Spacer()
        }
        .padding()
        
        // Max Width and Alignment
        Image(systemName: "xmark")
            .frame(width: 32, height: 32)
            .background(Circle().stroke())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        
        // Overlay
        Rectangle()
            .fill(Color.blue)
            .overlay(
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .background(Circle().stroke())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding()
            )
    }
}

#if DEBUG
struct MaxWidthAndFrameAlignment_Previews: PreviewProvider {
    static var previews: some View {
        MaxWidthAndFrameAlignment()
    }
}
#endif
