
import SwiftUI

struct TextField_Customizing : View {
    @State private var textFieldWithText = "With Text"
    @State private var textFieldNoText = ""
    @State private var withOutline = "With Outline"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Customizing")
                .foregroundColor(.gray)
            Text("One way to customize TextFields is to add a shape behind one that has no TextFieldStyle set.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            TextField("Placeholder Text", text: $textFieldNoText)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(hue: 0.126, saturation: 0.47, brightness: 0.993)))
                .padding()
            
            TextField("Placeholder Text", text: $withOutline)
                .padding(10)
                .overlay(
                    // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.orange, lineWidth: 2)
            )
                .padding()
            
            Text("Change text color using the foregroundColor property.")
                .frame(maxWidth: .infinity).padding().background(Color.orange)
            
            TextField("first name", text: $textFieldWithText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.orange)
                .padding(.horizontal)
        }
        .font(.title)
        .minimumScaleFactor(0.7)
    }
}

struct TextField_Customizing_Previews : PreviewProvider {
    static var previews: some View {
        TextField_Customizing()
    }
}
