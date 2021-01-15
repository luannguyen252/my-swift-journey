import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLastItem<T: Identifiable>(_ item: T) -> Bool {
        guard !isEmpty else { return false }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }

    public func isOffsetItem<T: Identifiable>(offset: Int, item: T) -> Bool {
        guard !isEmpty else { return false }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        let offset = offset < count ? offset : count - 1
        return offset == (distance - 1)
    }
}
