//
//  ContentView.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/16.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ContentView: View {
	
	@ObservedObject var viewModel: FeedsViewModel
	@State private var showLoading = false
	@State private var showSplash = true
	
	init() {
		let url = URL(string: "https://news.google.com/rss")!
		self.viewModel = FeedsViewModel(url: url)
	}
	
    var body: some View {
		ZStack {
			List(viewModel.allFeeds) { feed in
				NavigationLink(destination: WebView(url: feed.link)) {
					FeedView(feed: feed)
				}
			}
			.pullToRefresh(isShowing: $showLoading) {
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
					self.viewModel.parse()
					self.showLoading = false
				}
			}
			
			SplashScreen()
			  .opacity(showSplash ? 1 : 0)
			  .onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
				  withAnimation() {
					self.showSplash = false
				  }
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
