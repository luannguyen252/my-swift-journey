//
//  OrderedSet.swift
//  
//
//  Created by Max Kuznetsov on 18.10.2020.
//

import Foundation

public struct OrderedSet<E: Hashable>: Equatable, Collection {
    public typealias Element = E
    public typealias Index = Int
    
    #if swift(>=4.1.50)
    public typealias Indices = Range<Int>
    #else
    public typealias Indices = CountableRange<Int>
    #endif
    
    private var array: [Element]
    private var set: Set<Element>
    
    /// Creates an empty ordered set.
    public init() {
        self.array = []
        self.set = Set()
    }
    
    /// Creates an ordered set with the contents of `array`.
    ///
    /// If an element occurs more than once in `element`, only the first one
    /// will be included.
    public init(_ array: [Element]) {
        self.init()
        for element in array {
            append(element)
        }
    }
    
    // MARK: Working with an ordered set
    /// The number of elements the ordered set stores.
    public var count: Int { return array.count }
    
    /// Returns `true` if the set is empty.
    public var isEmpty: Bool { return array.isEmpty }
    
    /// Returns the contents of the set as an array.
    public var contents: [Element] { return array }
    
    /// Returns `true` if the ordered set contains `member`.
    public func contains(_ member: Element) -> Bool {
        return set.contains(member)
    }
    
    /// Adds an element to the ordered set.
    ///
    /// If it already contains the element, then the set is unchanged.
    ///
    /// - returns: True if the item was inserted.
    @discardableResult
    public mutating func append(_ newElement: Element) -> Bool {
        let inserted = set.insert(newElement).inserted
        if inserted {
            array.append(newElement)
        }
        return inserted
    }
    
    public mutating func append(_ array: [Element]) {
        array.forEach { append($0) }
    }
    
    /// Remove and return the element at the beginning of the ordered set.
    public mutating func removeFirst() -> Element {
        let firstElement = array.removeFirst()
        set.remove(firstElement)
        return firstElement
    }
    
    /// Remove and return the element at the end of the ordered set.
    public mutating func removeLast() -> Element {
        let lastElement = array.removeLast()
        set.remove(lastElement)
        return lastElement
    }
    
    /// Remove all elements.
    public mutating func removeAll(keepingCapacity keepCapacity: Bool) {
        array.removeAll(keepingCapacity: keepCapacity)
        set.removeAll(keepingCapacity: keepCapacity)
    }
    
    public mutating func removeAll(where sholdBeRemoved: (Element) -> Bool = { _ in true }) {
        array.removeAll(where: sholdBeRemoved)
        set = set.filter { !sholdBeRemoved($0) }
    }
}

extension OrderedSet: ExpressibleByArrayLiteral {
    /// Create an instance initialized with `elements`.
    ///
    /// If an element occurs more than once in `element`, only the first one
    /// will be included.
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension OrderedSet: RandomAccessCollection {
    public var startIndex: Int { return contents.startIndex }
    public var endIndex: Int { return contents.endIndex }
    public subscript(index: Int) -> Element {
        return contents[index]
    }
}

public func == <T>(lhs: OrderedSet<T>, rhs: OrderedSet<T>) -> Bool {
    return lhs.contents == rhs.contents
}

extension OrderedSet: Hashable where Element: Hashable {
    
    @discardableResult
    public mutating func remove(_ element: Element) -> Element? {
        if let index = array.firstIndex(of: element) {
            array.remove(at: index)
        }
        
        return set.remove(element)
    }
}

public extension Dictionary {
    mutating func append<V>(value: V, by key: Key) where Value == OrderedSet<V> {
        var set = self[key] ?? []
        set.append(value)
        self[key] = set
    }
}
