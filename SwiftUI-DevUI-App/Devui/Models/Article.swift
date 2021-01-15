//
//  Article.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

struct Article: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let coverImage: String?
    let tags: [String]
    let url: String
    let commentsCount: Int
    let reactionsCount: Int
    let pageViewsCount: Int
    let publishedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case coverImage = "cover_image"
        case tags = "tag_list"
        case url
        case commentsCount = "comments_count"
        case reactionsCount = "positive_reactions_count"
        case pageViewsCount = "page_views_count"
        case publishedAt = "published_at"
    }
}
