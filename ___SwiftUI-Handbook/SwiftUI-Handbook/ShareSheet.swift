import SwiftUI

struct ShareSheet: View {
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.black)
        }
    }
    
    // Share Button
    func shareButton() {
        let url = URL(string: "https://designcode.io")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
    }
}

#if DEBUG
struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet()
    }
}
#endif
