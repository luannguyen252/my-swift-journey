import SwiftUI

struct ContentView: View {
    @State private var receiptAmount = "0.0"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Receipt amount", text: $receiptAmount)
                        .keyboardType(.decimalPad)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
