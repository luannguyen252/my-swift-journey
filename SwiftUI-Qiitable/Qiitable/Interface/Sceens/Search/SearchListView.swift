import SwiftUI

struct SearchListView: View {
    @ObservedObject var presenter: SesarchListPresenterImpl

    var body: some View {
        List(presenter.items) { item in
            NavigationLink(destination: ArticleView(item: item)) {
                HomeItemCell(item: item)
            }
        }
        .onAppear {
            self.presenter.onAppear()
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = ItemRepositoryImpl(connection: ConnectionImpl(session: URLSession.shared))
        let useCase = SearchListUseCaseImpl(repository: repository)
        return SearchListView(presenter: SesarchListPresenterImpl(searchText: "", useCase: useCase))
    }
}
