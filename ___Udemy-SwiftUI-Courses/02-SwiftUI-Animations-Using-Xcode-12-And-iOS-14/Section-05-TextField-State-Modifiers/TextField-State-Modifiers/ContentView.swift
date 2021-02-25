import SwiftUI

struct ContentView: View {
    @State private var stateString: String = ""
    @State private var emailString: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Playing with TextField")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            TextField("Place holder text", text: $stateString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.init(top: 40, leading: 20, bottom: 100, trailing: 20))
            
            Text("This text has just been updated: \n \(stateString)")
                .font(.custom("serif", fixedSize: 24))
                .foregroundColor(.black)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            
            TextField("Enter an email adderess", text: $emailString, onEditingChanged: { status in
                print("Keyboard tapped status - \(status)")
                print(self.$emailString.wrappedValue)
            }) {
                print("The return key has been pressed")
            }
            .textContentType(.emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.subheadline)
            .fixedSize()
            .padding()
            
            Text("A secure text field")
                .font(.largeTitle)
                .padding(.init(top: 40, leading: 20, bottom: 100, trailing: 20))
            
            SecureField("Enter your password", text: $password, onCommit: {
                print(self.password)
                print("Returned pressed - done!")
            })
            .foregroundColor(.red)
            .frame(height: 40)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(Color.black, width: 1)
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
