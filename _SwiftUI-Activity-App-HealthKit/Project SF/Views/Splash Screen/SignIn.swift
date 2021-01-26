import SwiftUI

struct SignIn: View {
    @State var username = ""

    var body: some View {
        VStack {
            Spacer()
            
            GroupBox {
                TextField("Enter your name", text: $username) { (didChange) in
                    print(didChange)
                } onCommit: {
                    print("Commited")
                }
            }
            .padding()
            
            Spacer()
            
            RoundedButton("Continue") {
                print(123)
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
