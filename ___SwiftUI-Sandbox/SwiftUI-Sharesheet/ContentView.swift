import SwiftUI

struct ShareSheet: View {
    @State var show = false
    @State var items: [Any] = []
    var body: some View {
        VStack {
            Button(action: {
                //Add Logic to add items here
                self.show.toggle()
            }) {
                Text("Share").padding().foregroundColor(.white)
            }.background(Color.black).cornerRadius(10)
        }.sheet(isPresented: $show) {
            ShareSheetView(items: items).edgesIgnoringSafeArea(.all)
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
