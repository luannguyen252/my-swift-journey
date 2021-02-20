// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

import SwiftUI
import UIKit

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

/// see also https://stackoverflow.com/questions/56533564/showing-uiactivityviewcontroller-in-switui
struct ShareSheetExampleView: View {

    @State private var isSharePresented: Bool = false

    var body: some View {
        Button("Share") {
            self.isSharePresented = true
        }
        .sheet(
            isPresented: $isSharePresented,
            onDismiss: {
                print("Dismissed")
            },
            content: {
                ActivityViewController(activityItems: [URL(string: "https://www.apple.com")!])
            }
        )
    }
}

struct ShareSheetExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetExampleView()
    }
}
