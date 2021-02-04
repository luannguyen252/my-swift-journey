import SwiftUI

struct HStackView3: View {
    var body: some View {
        HStack(spacing: 16) {
            Text("1")
            Text("+")
            Text("1")
            Text("=")
            Text("2")
            
            Spacer()
            Divider()
            Spacer()
            
            Text("Correct")
        }
        .font(.system(size: 40))
        .padding()
    }
}

struct HStackView3_Previews: PreviewProvider {
    static var previews: some View {
        HStackView3()
    }
}
