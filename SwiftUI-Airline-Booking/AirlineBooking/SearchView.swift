import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @State private var isEditing = false
        
    var body: some View {
        HStack {
            TextField("Search your destination", text: $text)
                .padding(10)
                .padding(.horizontal, 20)
                .foregroundColor(Color(UIColor.lightGray))
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(UIColor.lightGray))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                ).onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
