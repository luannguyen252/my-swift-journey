//
//  FeedsViewModelTests.swift
//  RSSReaderTests
//
//  Created by Geonseok Lee on 2020/04/02.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

@testable import RSSReader
import XCTest

class FeedsViewModelTests: XCTestCase {

	var sut: FeedsViewModel!
	
	override func setUp() {
		super.setUp()
		sut = FeedsViewModel(url: URL(string: "https://news.google.com/rss")!)
	}
	
	override  func tearDown() {
		sut = nil
		super.tearDown()
	}
}
