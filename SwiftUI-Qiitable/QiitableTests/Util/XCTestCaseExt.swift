import XCTest

// https://github.com/shindyu/XCTestExtensions
extension XCTestCase {
    public func XCTxContext(_ named: String, block: ()->()) {
        self.setUp()
        XCTContext.runActivity(named: named, block: { _ in block() })
        self.tearDown()
    }
}
