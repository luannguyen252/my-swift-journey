//
//  FeedView.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/23.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct FeedView: View {
	var feed: Feed
    var body: some View {
		HStack() {
			KFImage(self.feed.thumbnailURL)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 120, height: 120)
			Spacer(minLength: 8)
			VStack {
				Text(self.feed.title)
					.modifier(FeedTitleStyle())
				Text(self.feed.description)
					.modifier(FeedBodyStyle())
				HStack {
					ForEach(feed.keywords, id: \.self) { keyword in
						KeywordBadge(string: keyword)
					}
					Spacer()
				}
			}
		}
		.frame(height: 120)
    }
}

// MARK: - 키워드 뷰
struct KeywordBadge: View {
	var string: String
	var body: some View {
		Text(string)
			.font(.system(size: 12))
			.padding(2)
			.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(red: 182/255, green: 182/255, blue: 182/255), lineWidth: 1))
	}
}
