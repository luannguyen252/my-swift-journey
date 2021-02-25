import SwiftUI

struct LinkFromAText: View {
    var body: some View {
        // Single link
        Text("Visit Design+Code")
            .onTapGesture {
                UIApplication.shared.open(URL(string: "https://designcode.io")!, options: [:])
            }
        
        // Multiple links
        HStack {
            Text("You agree to our")

            Text("Terms")
                .onTapGesture {
                     UIApplication.shared.open(URL(string: "https://designcode.io/terms")!, options: [:])
                }

            Text("and")

            Text("Privacy policy")
                .onTapGesture {
                     UIApplication.shared.open(URL(string: "https://designcode.io/privacy")!, options: [:])
                }

            Text(".")
        }
    }
}

#if DEBUG
struct LinkFromAText_Previews: PreviewProvider {
    static var previews: some View {
        LinkFromAText()
    }
}
#endif
