import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("Hello, Memo App")
    }
}

#if DEBUG
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
#endif
