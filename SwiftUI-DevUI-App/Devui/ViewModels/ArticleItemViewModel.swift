//
//  ArticleItemViewModel.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

class ArticleItemViewModel {
    private let article: Article
    private lazy var formatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter
    }()
    
    var title: String { article.title }
    var publishedAt: String { formatter.localizedString(for: article.publishedAt, relativeTo: Date()) }
    var pageViews: String { "\(article.pageViewsCount)" }
    var reactions: String { "\(article.reactionsCount)" }
    var comments: String { "\(article.commentsCount)" }
    var url: URL { URL(string: article.url)! }
    
    var accessibilityReactions: String {
        String(format: NSLocalizedString("accessibility_label_reactions", comment: ""), article.pageViewsCount, article.reactionsCount, article.commentsCount)
    }
    
    init(_ article: Article) {
        self.article = article
    }
}
