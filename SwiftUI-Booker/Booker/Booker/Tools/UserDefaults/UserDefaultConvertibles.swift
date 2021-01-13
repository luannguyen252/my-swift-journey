import UIKit

extension Int: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? Int else { return nil }
        self = value
    }
    func object() -> Any? { return self }
}

extension String: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? String else { return nil }
        self = value
    }
    func object() -> Any? { self }
}

extension Optional: UserDefaultConvertible where Wrapped: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = Wrapped(with: object) else { return nil }
        self = .some(value)
    }
    func object() -> Any? {
        switch self {
        case .some(let value): return value.object()
        case .none: return .none
        }
    }
}

extension Array: UserDefaultConvertible where Element: UserDefaultConvertible {
    private struct Error: Swift.Error {}
    
    init?(with object: Any) {
        guard let array = object as? [Any] else { return nil }
        guard let value = try? array.map({ (object) -> Element in
            if let element = Element(with: object) {
                return element
            }else {
                throw Error()
            }
        })else { return nil }
        self = value
    }
    
    func object() -> Any? {
        return try? self.map { (element) -> Any in
            if let object = element.object() {
                return object
            }else {
                throw Error()
            }
        }
    }
}

extension Set: UserDefaultConvertible where Element: UserDefaultConvertible, Element: Hashable {
    private struct Error: Swift.Error {}
    
    init?(with object: Any) {
        guard let array = object as? [Any] else { return nil }
        guard let value = try? array.map({ (object) -> Element in
            if let element = Element(with: object) {
                return element
            }else {
                throw Error()
            }
        })else { return nil }
        self = .init(value)
    }
    
    func object() -> Any? {
        return try? self.map { (element) -> Any in
            if let object = element.object() {
                return object
            }else {
                throw Error()
            }
        }
    }
}

extension Date: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? Date else { return nil }
        self = value
    }
    func object() -> Any? { self }
}

extension Bool: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? Bool else { return nil }
        self = value
    }
    func object() -> Any? { self }
}

extension CGFloat: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? CGFloat else { return nil }
        self = value
    }
    func object() -> Any? { self }
}

extension Double: UserDefaultConvertible {
    init?(with object: Any) {
        guard let value = object as? Double else { return nil }
        self = value
    }
    func object() -> Any? { self }
}
