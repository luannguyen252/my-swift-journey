//
//  Feed.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/16.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import Foundation

struct Feed: Identifiable {
	let id = UUID()
	let title: String
	let thumbnailURL: URL
	let description: String
	let link: URL	// Self address
	let keywords: [String]
}
