import SwiftUI
import AlertToast

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                 showAlert.toggle()
            }
        }
        .presentAlert(isPresenting: $showAlert) {
            AlertToast(type: .regular, title: "Message Sent!")
        }
    }
}

// Complete Modifier Example
//.presentAlert(isPresenting: $showAlert, duration: 2, tapToDismiss: true, alert: {
//
//   //AlertToast Goes Here
//
//}, completion: { dismissed in
//   //Completion block after dismiss (returns true)
//})

// Alert dialog view modifier (with default settings):
//.presentAlert(isPresenting: Binding<Bool>, duration: Double = 2, tapToDismiss: true, alert: { () -> AlertToast }, completion: { (Bool) -> () })

// A full AlertToast implementation:
//AlertToast(type: AlertType, title: Optional(String), subTitle: Optional(String), titleFont: Optional(Font), subTitleFont: Optional(Font), boldTitle: Optional(Bool))

// Simple Text Alert:
//AlertToast(type: .regular, title: Optional(String), subTitle: Optional(String))

// Complete/Error Alert:
//AlertToast(type: .complete(Color)/.error(Color), title: Optional(String), subTitle: Optional(String))

// System Image Alert:
//AlertToast(type: .systemImage(String, Color), title: Optional(String), subTitle: Optional(String))

// Image Alert:
//AlertToast(type: .image(String), title: Optional(String), subTitle: Optional(String))

// Loading Alert:
//AlertToast(type: .loading, title: Optional(String), subTitle: Optional(String))

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
