import SwiftUI
import PlaygroundSupport

struct Screen: View {
    @State var show = false
    @State var items: [Any] = []
    var body: some View {
        VStack {
            Button(action: {
                self.items.removeAll()
                self.items.append(UIImage(named: "886F0165-77FA-4778-8E50-8DD24B230839.jpg"))
                self.show.toggle()
            }) {
                Text("Share")
            }.sheet(isPresented: $show) {
                ShareSheetView(items: self.items).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ShareSheetView: UIViewControllerRepresentable {
    let items: [Any]
    func makeUIViewController(context: Context) -> some UIActivityViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

PlaygroundPage.current.setLiveView(Screen())