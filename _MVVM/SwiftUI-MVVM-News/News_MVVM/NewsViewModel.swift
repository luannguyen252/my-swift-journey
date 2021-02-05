//
//  NewsViewModel.swift
//  News_MVVM
//
//  Created by jb on 2020/10/12.
//

import Foundation

struct NewsViewModel{
    let news: News
    var author: String{
        return news.author ?? "Unknown"
    }
    var description: String{
        return news.description ?? ""
    }
    var title: String{
        return news.title ?? ""
    }
    var url: String{
        return news.url ?? ""
    }
    var urlToImage: String{
        return news.urlToImage ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
    var publishedAt: String{
        return news.publishedAt
    }
    
}
