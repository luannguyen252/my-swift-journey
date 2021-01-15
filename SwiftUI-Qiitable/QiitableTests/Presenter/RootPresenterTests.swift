import XCTest
@testable import Qiitable

class RootPresenterTests: XCTestCase {
    var subject: RootPresenterImpl!
    var router: RootRouterMock!

    override func setUp() {
        router = .init()
        subject = .init(router: router)
    }
}
