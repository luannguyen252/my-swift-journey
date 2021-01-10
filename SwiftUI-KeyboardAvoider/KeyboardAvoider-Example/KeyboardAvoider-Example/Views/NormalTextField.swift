import SwiftUI

struct NormalTextField: View {
    var placeholder:String = ""
    var text:Binding<String>

    init(_ placeholder:String, text: Binding<String>) {
        self.placeholder = placeholder
        self.text = text
    }
    
    var body: some View {
        TextField(self.placeholder, text: self.text)
            .padding()
            .frame(
                minWidth: 0,
                idealWidth: nil,
                maxWidth: .infinity,
                minHeight: 44,
                idealHeight: 44,
                maxHeight: 44,
                alignment: .center)
            .foregroundColor(Color(UIColor.black))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.black), lineWidth: 1)
        )
    }
}
