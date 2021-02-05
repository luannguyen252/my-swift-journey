import SwiftUI

struct ContentView: View {
    
    var viewModel = ViewModel()
    @State var article: Article
    @State var isLoading = true
    
    var body: some View {

        HStack {
            VStack {
                Image(systemName: article.imageName)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.blue)
            }
            .frame(width: 60, height: 100, alignment: .center)

            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)

                Text(article.body)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .redacted(when: isLoading, redactionType: .customPlaceholder)
        }
        .padding()
        .onAppear {
            isLoading = true
            viewModel.fetchData() { article in
                isLoading = false
                self.article = article
            }
        }
        .animation(.easeInOut)
    }
}

extension View {
    @ViewBuilder
    func redacted(when condition: Bool, redactionType: RedactionType) -> some View {
        if !condition {
            unredacted()
        } else {
            redacted(reason: redactionType)
        }
    }

    func redacted(reason: RedactionType?) -> some View {
        self.modifier(Redactable(type: reason))
    }
}
