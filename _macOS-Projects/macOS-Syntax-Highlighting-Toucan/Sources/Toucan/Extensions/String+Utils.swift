import Foundation

extension String {
    func range(from range: Range<Index>) -> NSRange {
        NSRange(range, in: self)
    }
}
