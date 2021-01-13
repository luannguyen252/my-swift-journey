import SwiftUI

struct NewBookingView<ObsearvableModel: SearchModelProtocol>: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var editingBookTitle = false
    @State var title = ""
    @State var data = BookingData(book: Book(name: "", writer: ""), about: "", opinion: "")
    @ObservedObject var searchModel: ObsearvableModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Book".uppercased())) {
                    TextField("title", text: $searchModel.searchText,
                              onEditingChanged: {_ in self.editingBookTitle = true },
                              onCommit: { self.endEditing() })
                    
                    if self.editingBookTitle {
                        HorizontalSelectView(searchModel.books, selection: $data.book) { book in
                            ZStack {
                                SuggestedBookView(book: book)
                                    .frame(width: 150)
                                if book == self.data.book {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color.gray.opacity(0.6))
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .frame(height: 200)
                        .edgesIgnoringSafeArea([.leading, .trailing])
                    }
                }
                
                Section(header: Text("about".uppercased())) {
                    TextView($data.about, isEditable: true, placeholder: "about this book")
                }
                Section(header: Text("opinion".uppercased())) {
                    TextView($data.about, isEditable: true, placeholder: "opinion this book")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("New Booking")
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    },
                trailing:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
            )
        }
    }
    
    func endEditing() {
        UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        editingBookTitle = false
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView(editingBookTitle: true, searchModel: TestSearchModel())
    }
}
