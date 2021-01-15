import XCTest
@testable import Qiitable

class HomePresenterrTests: XCTestCase {
    var subject: HomePresenterImpl!
    var router: HomeRouterMock!
    var useCase: HomeUseCaseMock!

    override func setUp() {
        router = .init()
        useCase = .init()
        subject = .init(router: router, useCase: useCase)
    }

    override class func tearDown() {
        super.tearDown()
    }

    func test_onAppear() {
        XCTxContext("リクエストが成功したとき、記事が取得されること") {
            let stub = ItemFixture.test()
            useCase.fetchHandler = { offset, completion in
                completion(.success([stub]))
                XCTAssertEqual(offset, 1)
            }

            subject.onAppear()

            XCTAssertEqual(useCase.fetchCallCount, 1)
            XCTAssertEqual(subject.items, [stub])
        }
        XCTxContext("リクエストが失敗したとき") {
            useCase.fetchHandler = { offset, completion in
                completion(.failure(ErrorMock.test))
                XCTAssertEqual(offset, 1)
            }

            subject.onAppear()

            XCTAssertEqual(useCase.fetchCallCount, 1)
        }
    }

    func test_loadNext() {
        XCTxContext("最後のセルのとき、正常にリクエストされること") {
            var items: [Item] = (0..<20).map { num in
                return ItemFixture.test(id: String(num))
            }
            let lastItem = ItemFixture.test(id: "last-item-id")
            items.append(lastItem)
            useCase.fetchHandler = { offset, completion in
                completion(.success(items))
                XCTAssertEqual(offset, 1)
            }
            subject.onAppear()
            XCTAssertEqual(useCase.fetchCallCount, 1)

            useCase.fetchHandler = { offset, completion in
                completion(.success(items))
                XCTAssertEqual(offset, 2)
            }
            let expectedItems = items + items
            subject.loadNext(item: lastItem)

            XCTAssertEqual(useCase.fetchCallCount, 2)
            XCTAssertEqual(subject.isLoading, false)
            XCTAssertEqual(subject.nextPage, 2)
            XCTAssertEqual(subject.items, expectedItems)
        }
        XCTxContext("最後のセルでないとき、リクエストされないこと") {
            let items: [Item] = (0..<20).map { num in
                return ItemFixture.test(id: String(num))
            }

            useCase.fetchHandler = { offset, completion in
                completion(.success(items))
                XCTAssertEqual(offset, 1)
            }
            subject.onAppear()
            XCTAssertEqual(useCase.fetchCallCount, 1)

            subject.loadNext(item: items.first!)

            XCTAssertEqual(useCase.fetchCallCount, 1)
            XCTAssertEqual(subject.isLoading, false)
            XCTAssertEqual(subject.nextPage, 1)
            XCTAssertEqual(subject.items, items)
        }
    }
}
