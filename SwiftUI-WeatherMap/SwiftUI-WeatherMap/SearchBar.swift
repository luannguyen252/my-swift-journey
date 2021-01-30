import SwiftUI

struct SearchBar: View {
    @Binding var inputText: String
    var placeHolder: String = ""
    var onSearch: (String) -> Void
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color(.systemGray5))
        
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass.circle")
                    .imageScale(.large)
                    .frame(width: 36, height: 36, alignment: .center)
               
                TextField(placeHolder,
                          text: $inputText,
                          onEditingChanged: { editing in
                            self.isEditing = editing
                          },
                          onCommit: { onSearch(inputText) }
                )
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.webSearch)
                .padding(.horizontal,4)
                
                if isEditing {
                    Button(action: {
                        inputText = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18, alignment: .center)
                            .foregroundColor(.red)
                            .padding(.trailing)
                    })
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(inputText: .constant("Seacrching"), onSearch: {_ in})
            .previewLayout(.fixed(width: 375, height: 48))
    }
}
