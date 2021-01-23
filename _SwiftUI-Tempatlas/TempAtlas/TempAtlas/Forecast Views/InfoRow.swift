import SwiftUI

struct InfoRow : View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            
            Text(value)
            Spacer()
        }
    }
}

#if DEBUG
struct InfoRow_Previews : PreviewProvider {
    static var previews: some View {
        InfoRow(label: "Location:", value: "Charlottesville")
            .previewLayout(.sizeThatFits)
    }
}
#endif
