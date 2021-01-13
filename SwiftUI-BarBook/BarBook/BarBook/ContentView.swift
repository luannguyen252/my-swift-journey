import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @State private var isbn: String?
    @State private var foundBooks: Books?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("ABOUT THIS BOOK")){
                    Text("\(foundBooks?.items.first?.volumeInfo.title ?? "Title")")
                    Text("\(foundBooks?.items.first?.volumeInfo.subtitle ?? "Subtitle")")
                    Text("\(foundBooks?.items.first?.volumeInfo.authors.first ?? "Author")")
                }
                Section(header: Text("ADDITIONAL INFO")){
                    Text("\(foundBooks?.items.first?.volumeInfo.publishedDate ?? "Published date")")
                    Text("\(foundBooks?.items.first?.volumeInfo.pageCount ?? 0) Pages")
                    Text("\(foundBooks?.items.first?.volumeInfo.language ?? "Language")")
                    Text("ISBN: \(isbn ?? "")")
                }
            }
            .navigationBarTitle("BookInfo 📚")
            .navigationBarItems(trailing: Button(action: {
                self.isPresented.toggle()
            }) {
                Image(systemName: "barcode")
            }
            .sheet(isPresented: $isPresented) {
                BarCodeScanner(isbn: $isbn, foundBooks: $foundBooks)
            })
        }    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
