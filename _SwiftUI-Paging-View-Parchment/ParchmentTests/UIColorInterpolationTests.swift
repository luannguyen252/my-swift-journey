import CoreGraphics
import XCTest
@testable import Parchment

final class UIColorInterpolationTests: XCTestCase {
    // Colors initialized with UIColor(patternImage:) have only 1
    // color component. This test ensures we don't crash.
    func testImageFromPatternImageDefaultToBlack() {
        let from = UIColor.red
        let bundle = Bundle(for: Self.self)
        let image = UIImage(named: "Green", in: bundle, compatibleWith: nil)!
        let to = UIColor(patternImage: image)
        let result = UIColor.interpolate(from: from, to: to, with: 1)

        XCTAssertEqual(result, UIColor(red: 0, green: 0, blue: 0, alpha: 1))
    }
}
