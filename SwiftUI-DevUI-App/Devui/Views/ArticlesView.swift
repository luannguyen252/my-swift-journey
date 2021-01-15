//
//  ArticlesView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct ArticlesView: View {
    @StateObject private var model = ArticlesViewModel()
    
    func onArticleAppear(_ article: Article) {
        if model.articles.isLastItem(article) {
            model.loadMoreArticles()
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let error = model.error {
                    Text(NSLocalizedString(error.localizedDescription, comment: ""))
                } else if model.loading {
                    ProgressView()
                } else {
                    List(model.articles) { article in
                        ArticleItemView(article: article)
                            .onAppear(perform: { onArticleAppear(article) })
                    }
                }
            }
            .navigationTitle("section_articles")
        }
    }
}
