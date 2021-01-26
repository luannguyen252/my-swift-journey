//
//  Project_SFTests.swift
//  Project SFTests
//
//  Created by William Taylor on 10/7/20.
//

import XCTest
@testable import Project_SF

class ProjectSFTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Utilities

    func testRangeConversion() throws {
        XCTAssertEqual(1.0.convert(fromRange: 0...10, toRange: 0...1), 0.1)
        XCTAssertEqual(0.25.convert(fromRange: 0...1, toRange: 0...100), 25.0)
        XCTAssertEqual(0.1.convert(fromRange: 0...1, toRange: 0...10), 1.0)
        XCTAssertEqual(0.convert(fromRange: 0...5, toRange: 0...10), 0)
        XCTAssertEqual(5.convert(fromRange: 0...5, toRange: 0...10), 10)
    }
    
    // MARK: Network Manager
    
    func testNetworkManagerSuccessfulRequest() throws {
        let expect = XCTestExpectation()

        let mock = URLSessionMock()
        mock.data = Data([1, 0, 1, 1, 0])
        
        let networkManager = NetworkManager(urlSession: mock)

        networkManager.request(URL(string: "fake")) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, mock.data)
                expect.fulfill()
            default: return
            }
        }

        wait(for: [expect], timeout: 1)
    }
    
    func testNetworkManagerErrorRequest() throws {
        let expect = XCTestExpectation()

        let mock = URLSessionMock()
        mock.error = FakeError()
        
        let networkManager = NetworkManager(urlSession: mock)

        networkManager.request(URL(string: "fake")) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, NetworkManager.NetworkError.networkError)
                expect.fulfill()
            default: expect.fulfill()
            }
        }

        wait(for: [expect], timeout: 1)
    }
    
    func testNetworkManagerNoDataRequest() throws {
        let expect = XCTestExpectation()

        let mock = URLSessionMock()
        
        let networkManager = NetworkManager(urlSession: mock)

        networkManager.request(URL(string: "fake")) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, NetworkManager.NetworkError.noDataInResponse)
                expect.fulfill()
            default: return
            }

        }

        wait(for: [expect], timeout: 1)
    }
    
    func testNetworkManagerRequestDecode() throws {
        let expect = XCTestExpectation()

        let mock = URLSessionMock()
        mock.data = """
        {
            "name": "test",
            "count": 10123
        }
        """.data(using: .utf8)
        
        let networkManager = NetworkManager(urlSession: mock)

        networkManager.request(URL(string: "fake"), decode: SampleDataStruct.self) { result in
            switch result {
            case .success(let decodedObject):
                XCTAssertEqual(decodedObject.name, "test")
                XCTAssertEqual(decodedObject.count, 10123)
                expect.fulfill()
            default: return
            }
        }

        wait(for: [expect], timeout: 1)
    }
    
    // MARK: Performance

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: Fake Error
    
    private struct FakeError: Error {
        
        let uuid = UUID()
        
    }
    
    // MARK: Sample Data Struct
    
    private struct SampleDataStruct: Codable {
        
        let name: String
        
        let count: Int
        
    }

}
