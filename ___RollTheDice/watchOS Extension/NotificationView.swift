import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("You Play Roll The Dice Game")
    }
}

#if DEBUG
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
#endif
