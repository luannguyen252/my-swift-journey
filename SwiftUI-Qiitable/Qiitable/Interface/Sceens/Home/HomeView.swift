import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenterImpl

    var body: some View {
        NavigationView {
            List(presenter.items) { item in
                NavigationLink(destination: ArticleView(item: item)) {
                    HomeItemCell(item: item)
                        .onAppear {
                            self.presenter.loadNext(item: item)
                        }
                }
            }
            .navigationBarTitle("新着記事")
        }.onAppear {
            self.presenter.onAppear()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            presenter: HomePresenterImpl(
                router: HomeRouterImpl(),
                useCase: HomeUseCaseImpl(
                    repository: ItemRepositoryImpl(
                        connection: ConnectionImpl(
                            session: URLSession.shared
                        )
                    )
                )
            )
        )
    }
}
