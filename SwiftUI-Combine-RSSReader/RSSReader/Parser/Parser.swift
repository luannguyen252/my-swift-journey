//
//  Parser.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/03/23.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import Foundation
import Combine
import SwiftSoup

struct FeedParser {
	
	/// Error 타입 선언
	enum FeedError: Error {
		case Unknown
	}
	
	/// 파싱 작업 큐
	private let parsingQueue = DispatchQueue(label: "parsingQueue", qos: .default, attributes: .concurrent)
	
	/// 피드 파싱 메소드
	///
	/// - Parameter item: SwiftSoup.Element 타입의 파싱 타겟
	/// - Returns: AnyPublsher<Feed, Never>
	private func feed(item: Element) -> AnyPublisher<Feed, Never> {
		Just(item)
			.receive(on: parsingQueue)
			.tryMap { item -> Feed in
				let titleEl = try item.getElementsByTag("title")
				let linkEl = try item.getElementsByTag("link")
				let title = try titleEl.text()
				let linkContents = try String(contentsOf: URL(string: try linkEl.text())!)
				let linkDoc = try SwiftSoup.parse(linkContents)
				let imageProperty = try linkDoc.getElementsByAttributeValue("property", "og:image")
				guard let imageLink = URL(string: try imageProperty.attr("content")) else {
					throw FeedError.Unknown
				}
				let descriptionProperty = try linkDoc.getElementsByAttributeValue("property", "og:description")
				let descriptionContent = try descriptionProperty.attr("content")
				let keywords = self.keywordParser(contents: descriptionContent)
				let feed = Feed(title: title, thumbnailURL: imageLink, description: descriptionContent, link: URL(string: try linkEl.text())!, keywords: keywords)
				return feed
			}
			.catch { _ in
				Empty()
			}
			.eraseToAnyPublisher()
	}
	
	/// Merging all the publishers into a single downstream
	/// will produce continuous stream of Feed values
	///
	/// - Parameter items: SwiftSoup.Elements타입의 피드 대상 리스트
	/// - Returns: single downstream AnyPublisher<Feed, Never>
	private func mergedFeeds(items: Elements) -> AnyPublisher<Feed, Never> {
		let items = items.array()
		let initialPublisher = feed(item: items[0])
		let remainder = Array(items.dropFirst())

		return remainder.reduce(initialPublisher) { (combined, item) ->
			AnyPublisher<Feed, Never> in
			return combined.merge(with: feed(item: item))
				.eraseToAnyPublisher()
		}
	}

	/// 피드 리스트 파싱 메소드
	///
	/// - Parameter contents: 파싱 대상 xml 문자열
	/// - Returns: AnyPublsher<[Feed], Never>
	func feeds(contents: String) -> AnyPublisher<[Feed], Never> {
		guard let doc = try? SwiftSoup.parse(contents, "", Parser.xmlParser()),
			let items = try? doc.getElementsByTag("item"),
			!items.isEmpty() else { return Empty().eraseToAnyPublisher() }
		return Just(items)
			.flatMap { items in
				// fetch the feed details, flatten all the feed publisher
				return self.mergedFeeds(items: items)
			}
			.scan([], { (feeds, feed) -> [Feed] in
				return feeds + [feed]
			})
			.eraseToAnyPublisher()
	}
	
	
	func keywordParser(contents: String) -> [String] {
		let components = contents.components(separatedBy: .whitespacesAndNewlines)
		let words = components.filter { !$0.isEmpty }
		var wordDictionary = Dictionary<String, Int>()
		for word in words {
			guard word.count > 1 else { continue }
			if let count = wordDictionary[word] {
				wordDictionary[word] = count + 1
			} else {
				wordDictionary[word] = 1
			}
		}
		let sorted = wordDictionary.sorted(by: {
			if $0.1 == $1.1 {
				return $0.0 < $1.0
			} else {
				return $0.1 > $1.1
			}
		}).map { $0.0 }
		return Array(sorted.prefix(3))
	}
	
}
