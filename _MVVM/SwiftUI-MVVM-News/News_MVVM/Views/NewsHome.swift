//
//  NewsHome.swift
//  News_MVVM
//
//  Created by jb on 2020/10/12.
//

import SwiftUI

struct NewsHome: View {
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    init(){
        newsListViewModel.load()
    }
    
    var body: some View {
        VStack{
            NewsListHeader()
            NewsListView(newsCollection: self.newsListViewModel.news, imageData: self.newsListViewModel.imageData)
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
