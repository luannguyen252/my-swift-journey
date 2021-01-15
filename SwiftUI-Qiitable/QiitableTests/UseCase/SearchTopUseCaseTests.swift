import XCTest
@testable import Qiitable

class SearchListUseCaseTests: XCTestCase {
    var subject: SearchListUseCaseImpl!
    var repository: ItemRepositoryMock!

    override func setUp() {
        repository = .init()
        subject = .init(repository: repository)
    }

    func test_fetch() {
        XCTxContext("リクエストされること") {
            subject.fetch(query: "SwiftUI", page: 1) { _ in }

            XCTAssertEqual(repository.searchCallCount, 1)
        }
    }
}
