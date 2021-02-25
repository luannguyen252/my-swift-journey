import SwiftUI

struct CategoryListView: View {
  @ObservedObject var categoryProvider: CategoryProvider
  var categoryContext: CategoryProvider.ProviderContext

  init(categoryContext: CategoryProvider.ProviderContext, dataProvider: DataProvider) {
    self.categoryContext = categoryContext

    self.categoryProvider = CategoryProvider(dataProvider: dataProvider)
    self.categoryProvider.currentContext = categoryContext
  }

  var body: some View {
    Group {
      ScrollView(.vertical, showsIndicators: false) {
        if categoryProvider.categories.isEmpty {
          VStack {
            Text(categoryContext.missingCategoriesTitle)
              .font(.title2)
              .bold()
              .foregroundColor(Color.primary)
            Text(categoryContext.missingCategoriesDescription)
              .font(.title3)
              .foregroundColor(Color.secondary)
          }.padding()
        } else {
          LazyVStack(alignment: .leading) {
            ForEach(categoryProvider.categories) { category in
              CategoryRow(
                category: category,
                showOnlyFavorites: categoryContext == .favorites
              )
            }
            .animation(.default)
          }
        }
      }
    }
    .navigationTitle(categoryContext.formattedName)
    .onAppear {
      categoryProvider.refresh()
    }
  }
}

#if DEBUG
struct CategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryListView(categoryContext: .general, dataProvider: DataProvider())
  }
}
#endif
