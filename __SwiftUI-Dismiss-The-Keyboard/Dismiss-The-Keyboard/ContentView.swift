import SwiftUI

struct ContentView: View {
    @State private var number   = ""
    @State private var note     = ""
    @State private var email    = ""
    @State private var phone    = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Decimal Pad Keyboard", text: $number)
                        .keyboardType(.decimalPad)
                    
                    TextField("Alphabet Keyboard", text: $note)
                        .keyboardType(.alphabet)
                    
                    TextField("Email Address Keyboard", text: $email)
                        .keyboardType(.emailAddress)
                    
                    TextField("Phone Pab Keyboard", text: $phone)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("Dismiss Keyboard")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
#endif
