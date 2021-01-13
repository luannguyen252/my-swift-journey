import SwiftUI

struct BookView: View {
    let book: Book
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LinkImage(self.book.imageURL) {
                    Image(systemName: "book")
                        .font(.system(size: 60))
                }
                .frame(height: geometry.size.height * 0.6)
                
                Button(action: {
                    guard let url = self.book.url else { return }
                    UIApplication.shared.open(url)
                }) {
                    Text("Open in Apple Books")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .disabled(self.book.url == nil)
                .frame(width: geometry.size.width - 90, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(.systemGray))
                )
                
                VStack(alignment: .leading) {
                    if self.book.writer != nil {
                        Text("Author").font(.title)
                            .padding([.leading, .top])
                        Text(self.book.writer!)
                            .padding([.leading, .trailing])
                    }
                    if self.book.about != nil {
                        Text("Description").font(.title)
                            .padding([.leading, .top])
                        Text(self.book.about!)
                            .padding([.leading, .trailing])
                    }
                    if self.book.releaseDate != nil {
                        Text("Release Date").font(.title)
                            .padding([.leading, .top])
                        Text(self.book.releaseDate!.dayString)
                            .padding([.leading, .trailing])
                    }
                }
            }
        }
        .navigationBarTitle(book.name)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: TestModel().bookingDatas[3].book)
    }
}
