import SwiftUI

struct SearchTopView: View {
    @ObservedObject var presenter: SearchTopPresenterImpl

    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "気になる技術を調べよう！",
                    text: $presenter.searchText,
                    onEditingChanged: { _ in
                    }) {
                    self.presenter.onCommit()
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                Spacer()

                List {
                    Section(header: Text("検索履歴"), content: {
                        ForEach(presenter.historyItems, id: \.self) { text in
                            Text(text)
                        }
                    })
                }

                NavigationLink(destination: self.presenter.showSearchListView(), isActive: self.$presenter.isSearch) {
                    EmptyView.init()
                }
            }
            .navigationBarTitle("検索", displayMode: .inline)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct SearchTopView_Previews: PreviewProvider {
    static var previews: some View {
        let router = SearchTopRouterImpl()
        let useCase = SeaerchTopUseCaseImpl()
        let presenter = SearchTopPresenterImpl(router: router, useCase: useCase)
        return
            SearchTopView(presenter: presenter)
    }
}
