import SwiftUI

struct ArticleView: View {
    let item: Item

    var body: some View {
        WebView(htmlBody: item.renderedBody)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        return ArticleView(item: ItemFixture.test())
            .previewLayout(.sizeThatFits)
    }
}
