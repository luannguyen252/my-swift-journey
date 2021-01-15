import XCTest
@testable import Qiitable

class SearchListPresenterTests: XCTestCase {
    var subject: SesarchListPresenterImpl!
    var useCase: SearchListUseCaseMock!
    
    override func setUp() {
        useCase = .init()
        subject = .init(searchText: "SwiftUI", useCase: useCase)
    }
    
    func test_onAppear() {
        XCTxContext("正常にリクエストされること") {
            
            subject.onAppear()
            
            XCTAssertEqual(useCase.fetchCallCount, 1)
            XCTAssertEqual(subject.searchText, "SwiftUI")
        }
    }
}
