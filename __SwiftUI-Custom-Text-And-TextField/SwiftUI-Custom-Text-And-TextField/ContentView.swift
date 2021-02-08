import SwiftUI

struct ContentView: View {
    @State private var text: String = "Hello, Text View"
    @State private var textField: String = "This is Text Field"
    
    var body: some View {
        VStack {
            Text(text)
                .customTextStyle()
            
            VStack {
                TextField("Enter something here", text: $textField)
                    .textFieldStyle(AddLoanTextFieldStyle())
                Text(textField)
                    .customTextStyle()
            }
        }
    }
}

// Text View Modifier
extension Text {
    func customTextStyle() -> some View {
        self
            .foregroundColor(Color("pink2"))
            .font(.system(size: 24, weight: .heavy, design: .default))
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.6)
    }
}

// Text Field Style Modifier
struct AddLoanTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) var colorScheme
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let ModifiedGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.2)
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(width: 327, height: 50)
            .font(.system(size: 24))
            .padding(.horizontal)
            .foregroundColor(.gray)
            .background(colorScheme == .dark ? ModifiedGreyColor : lightGreyColor)
            .cornerRadius(10)
            .padding(.top, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
