//
//  News.swift
//  News_MVVM
//
//  Created by jb on 2020/10/12.
//

import Foundation


struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
    let publishedAt: String //date
}

struct NewsEnvelope : Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [News]
}
