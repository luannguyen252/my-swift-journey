import XCTest
@testable import Qiitable
import Combine

class ItemRepositoryTests: XCTestCase {
    var subject: ItemRepositoryImpl!
    var connection: ConnectionMock!

    override func setUp() {
        connection = .init()
        subject = .init(connection: connection)
    }

    func test_fetch() {
        XCTxContext("成功したとき") {
            let item = ItemFixture.test()

            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest(page: 1, query: nil))
                }
                return Future<[Item], Error> { promise in
                    promise(.success([item]))
                }.eraseToAnyPublisher()
            }
            
            subject.fetch(page: 1) { result in
                if case .success(let items) = result {
                    XCTAssertEqual(items, [item])
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
        XCTxContext("失敗したとき") {
            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest(page: 1, query: nil))
                }
                return Future<[Item], Error> { promise in
                    promise(.failure(ErrorMock.test))
                }.eraseToAnyPublisher()
            }

            subject.fetch(page: 1) { result in
                if case .failure(let error) = result {
                    XCTAssertEqual(error as! ErrorMock, ErrorMock.test)
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
    }

    func test_search() {
        XCTxContext("成功したとき") {
            let item = ItemFixture.test()

            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest(page: 1, query: "SwiftUI"))
                }
                return Future<[Item], Error> { promise in
                    promise(.success([item]))
                }.eraseToAnyPublisher()
            }

            subject.search(query: "SwiftUI", page: 1) { result in
                if case .success(let items) = result {
                    XCTAssertEqual(items, [item])
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
        XCTxContext("失敗したとき") {
            connection.callHandler = { req in
                if let req = req as? ItemRequest {
                    XCTAssertEqual(req, ItemRequest(page: 1, query: "SwiftUI"))
                }
                return Future<[Item], Error> { promise in
                    promise(.failure(ErrorMock.test))
                }.eraseToAnyPublisher()
            }

            subject.search(query: "SwiftUI", page: 1) { result in
                if case .failure(let error) = result {
                    XCTAssertEqual(error as! ErrorMock, ErrorMock.test)
                }
            }

            XCTAssertEqual(connection.callCallCount, 1)
        }
    }
}
