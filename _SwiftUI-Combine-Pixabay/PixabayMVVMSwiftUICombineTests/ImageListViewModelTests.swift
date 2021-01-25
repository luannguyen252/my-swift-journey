//
//  Copyright © 2019 An Tran. All rights reserved.
//

import XCTest
@testable import PixabayMVVMSwiftUICombine

class ImageListViewModelTests: XCTestCase {

    static let timeout: TimeInterval = 2.0

    var viewModel: ImageListViewModel!
    var pixaBayService: PixaBayServiceMock!

    override func setUp() {
        pixaBayService = PixaBayServiceMock()
        viewModel = ImageListViewModel(pixaBayService: pixaBayService)
    }

    override func tearDown() {
        viewModel = nil
    }

    func testDidChangeEmited() {
        let expectation = self.expectation(description: #function)

        _ = viewModel.didChange.sink {
            expectation.fulfill()
        }

        viewModel.search(withTerm: "sky")

        wait(for: [expectation], timeout: ImageListViewModelTests.timeout)
    }

    func testFetchingImagesSuccessfully() {
        let expectation = self.expectation(description: #function)

        _ = viewModel.didChange.sink {
            XCTAssertEqual(self.viewModel.images.count, 6)
            expectation.fulfill()
        }

        viewModel.search(withTerm: "sky")

        wait(for: [expectation], timeout: ImageListViewModelTests.timeout)
    }

    func testFetchingImagesFailed() {
        let expectation = self.expectation(description: #function)

        _ = viewModel.didChange.sink {
            XCTAssertEqual(self.viewModel.images.count, 0)
            expectation.fulfill()
        }

        pixaBayService.result = Result.failure(ServiceNetworkError.noData)
        viewModel.search(withTerm: "sky")

        wait(for: [expectation], timeout: ImageListViewModelTests.timeout)
    }

}
