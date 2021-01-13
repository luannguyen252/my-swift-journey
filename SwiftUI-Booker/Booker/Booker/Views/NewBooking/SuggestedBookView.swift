import SwiftUI

struct SuggestedBookView: View {
    let book: Book
    
    var body: some View {
        VStack {
            LinkImage(book.smallImageURL) {
                Image(systemName: "book").font(.largeTitle)
            }
            .frame(width: 100, height: 150)
            .background(Color(.systemGray3))
            
            Text(book.name)
        }
    }
}

struct SuggestedBookView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedBookView(book: TestModel().bookingDatas[0].book)
    }
}
