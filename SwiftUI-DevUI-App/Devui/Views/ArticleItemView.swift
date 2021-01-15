//
//  ArticleItemView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct ArticleItemView: View {
    @Environment(\.openURL) var openURL
    private let model: ArticleItemViewModel
    
    init(article: Article) {
        self.model = ArticleItemViewModel(article)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(model.title)
                .font(.headline)
            Text(model.publishedAt)
                .font(.subheadline)
            HStack(alignment: .center) {
                HStack(alignment: .center) {
                    ReactionView(title: model.pageViews, systemImage: "eye.fill", color: Color.green)
                    ReactionView(title: model.reactions, systemImage: "heart.fill", color: Color.red)
                    ReactionView(title: model.comments, systemImage: "bubble.right.fill", color: Color.blue)
                }
                .accessibilityElement(children: .ignore)
                .accessibility(label: Text(model.accessibilityReactions))
                Spacer()
                Link(destination: model.url) {
                    Image(systemName: "safari.fill")
                }
                .padding(4)
                .background(Color.primary.opacity(0.15))
                .cornerRadius(4)
                .buttonStyle(PlainButtonStyle())
                .accessibility(label: Text("accessibility_label_safari"))
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(label: Text("accessibility_label_article_item"))
    }
}
