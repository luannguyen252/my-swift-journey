//
//  FileRepositoryTests.swift
//  Unit Tests
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import XCTest
@testable import Picnic_Giphy

class FileRepositoryTests: XCTestCase {

    private var repository: FileRepository?
    private var url: URL?
    private let testData = "sampleData".data(using: .utf8)!
    
    override func setUp() {
        self.repository = FileRepository()
        url = repository?.cacheBaseURL.appendingPathComponent("TestFile")
        removeTestFile()
    }

    override func tearDown() {
        removeTestFile()
        repository = nil
    }

    func testWrite() {
        guard let url = url else {
            return
        }
        do {
            try repository?.write(testData, to: url)
        } catch {
            XCTFail("Failed to write data: " + error.localizedDescription)
        }
        XCTAssert(repository?.exists(in: url) ?? false, "Failed to write data")
    }

    func testRead() {
        guard let url = url else {
            return
        }
        try? repository?.write(testData, to: url)
        guard repository?.exists(in: url) == true else {
            return
        }
        var data: Data?
        do {
            data = try repository?.read(from: url)
        } catch {
            XCTFail("Failed to read data: " + error.localizedDescription)
        }
        XCTAssert(data == testData, "Failed to read data")
    }
    
    
    private func removeTestFile() {
        if let url = url {
            try? FileManager.default.removeItem(at: url)
        }
    }

}
