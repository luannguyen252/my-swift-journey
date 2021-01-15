import XCTest
@testable import Qiitable

class SearchTopPresenterTests: XCTestCase {
    var subject: SearchTopPresenterImpl!
    var router: SearchTopRouterMock!
    var useCase: SearchTopUseCaseMock!

    override func setUp() {
        router = .init()
        useCase = .init()
        subject = .init(router: router, useCase: useCase)
    }

    func test_onCommit() {
        XCTAssertEqual(subject.isSearch, false)

        subject.onCommit()

        XCTAssertEqual(subject.isSearch, true)
    }
}
