import SwiftUI

struct Links: View {
    var body: some View {
        // Link View
        Link("Design+Code",
              destination: URL(string: "https://designcode.io")!)
        
        // Customize the Link
        Link("Design+Code",
              destination: URL(string: "https://designcode.io")!)
                    .font(.title)
                    .foregroundColor(.purple)
        
        // Icon Link
        Link(destination: URL(string: "https://designcode.io")!) {
            Image(systemName: "link")
                .frame(width: 32, height: 32)
                .background(Color.blue)
                .mask(Circle())
                .foregroundColor(.white)
        }
    }
}

#if DEBUG
struct Links_Previews: PreviewProvider {
    static var previews: some View {
        Links()
    }
}
#endif
