//
//  NewsArticleView.swift
//  News_MVVM
//
//  Created by jb on 2020/10/12.
//

import SwiftUI

struct NewsArticleView: View {
    var newsUrl: String
    
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}

