import XCTest
@testable import Qiitable

class HomeUseCaseTests: XCTestCase {
    var subject: HomeUseCaseImpl!
    var repository: ItemRepositoryMock!
    
    override func setUp() {
        repository = .init()
        subject = .init(repository: repository)
    }
    
    func test_fetch() {
        XCTxContext("リクエストされること") {
            subject.fetch(page: 1) { _ in }
            
            XCTAssertEqual(repository.fetchCallCount, 1)
        }
    }
}
