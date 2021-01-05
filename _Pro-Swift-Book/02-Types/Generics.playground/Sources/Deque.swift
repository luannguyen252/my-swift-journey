import Foundation

public struct Deque<T> {
    private var items: [T]
    
    
    public init(_ items: [T] = []) {
        self.items = items
    }
    
    
    // MARK: - Computed Properties
    
    public var isEmpty: Bool {
        return items.isEmpty
    }


    // MARK: - Core Methods
    
    public mutating func popFront() -> T? {
        guard !isEmpty else { return nil }
        
        return items.removeFirst()
    }
    
    
    public mutating func popBack() -> T? {
        return items.popLast()
    }
    
    
    public mutating func pushFront(_ item: T) {
        items.insert(item, at: 0)
    }
    
    
    public mutating func pushBack(_ item: T) {
        items.append(item)
    }
}
