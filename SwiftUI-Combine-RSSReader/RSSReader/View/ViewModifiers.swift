//
//  ViewModifiers.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/23.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import SwiftUI

struct FeedTitleStyle: ViewModifier {
	func body(content: Content) -> some View {
		return content
			.padding(8)
			.font(.system(.headline))
			.lineLimit(1)
			.foregroundColor(.black)
	}
}


struct FeedBodyStyle: ViewModifier {
	func body(content: Content) -> some View {
		return content
			.padding(8)
			.font(.system(.body))
			.foregroundColor(.black)
	}
}

struct SplashTitleStyle: ViewModifier {
	
	let font = Font.system(.title).weight(.bold)
	
	func body(content: Content) -> some View {
		return content
			.font(font)
	}
}
