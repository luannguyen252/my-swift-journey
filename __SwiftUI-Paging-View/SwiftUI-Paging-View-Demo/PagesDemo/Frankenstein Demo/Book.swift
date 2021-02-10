import SwiftUI
import Pages

struct Book: View {
    let pages = bookToPages(charsInPage: 1400)
    @State var index: Int = 0

    var body: some View {
        ModelPages(self.pages, currentPage: $index, transitionStyle: .pageCurl) { i, page in
            GeometryReader { geometry in
                VStack {
                    if i == 0 {
                        Text("How I Did It")
                            .font(.system(size: 65, weight: .bold))
                            .bold()
                        Text("By Victor Frankenstein")
                            .font(.title)
                            .bold()
                            .padding(.bottom)
                    }
                    Text(page.text)
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Page \(i + 1)")
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
            }
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        Book()
    }
}
