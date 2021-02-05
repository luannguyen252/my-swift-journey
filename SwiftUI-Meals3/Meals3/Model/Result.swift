/// Result
///
/// Container for a successful value (T) or a failure with an NSError
///

import Foundation

/// A success `Result` returning `value`
/// This form is preferred to `Result.Success(Box(value))` because it
// does not require dealing with `Box()`
public func success<T,E>(_ value: T) -> Result<T,E> {
  return .success(Box(value))
}

/// A failure `Result` returning `error`
/// The default error is an empty one so that `failure()` is legal
/// To assign this to a variable, you must explicitly give a type.
/// Otherwise the compiler has no idea what `T` is. This form is preferred
/// to Result.Failure(error) because it provides a useful default.
/// For example:
///    let fail: Result<Int> = failure()
///

/// Dictionary keys for default errors
public let ErrorFileKey = "LMErrorFile"
public let ErrorLineKey = "LMErrorLine"

private func defaultError(_ userInfo: [AnyHashable: Any]) -> NSError {
    return NSError(domain: "", code: 0, userInfo: userInfo as? [String : Any])
}

private func defaultError(_ message: String, file: String = #file, line: Int = #line) -> NSError {
  return defaultError([NSLocalizedDescriptionKey: message, ErrorFileKey: file, ErrorLineKey: line])
}

private func defaultError(_ file: String = #file, line: Int = #line) -> NSError {
  return defaultError([ErrorFileKey: file, ErrorLineKey: line])
}

public func failure<T>(_ message: String, file: String = #file, line: Int = #line) -> Result<T,NSError> {
  let userInfo: [AnyHashable: Any] = [NSLocalizedDescriptionKey: message, ErrorFileKey: file, ErrorLineKey: line]
  return failure(defaultError(userInfo))
}

public func failure<T>(_ file: String = #file, line: Int = #line) -> Result<T,NSError> {
  let userInfo: [AnyHashable: Any] = [ErrorFileKey: file, ErrorLineKey: line]
  return failure(defaultError(userInfo))
}

public func failure<T,E>(_ error: E) -> Result<T,E> {
  return .failure(Box(error))
}

/// Construct a `Result` using a block which receives an error parameter.
/// Expected to return non-nil for success.

// Uwi, 2015-03-08: fixed this (pull request from modocache, pull request #38)
// old: public func try<T>(f: NSErrorPointer -> T?, file: String = __FILE__, line: Int = __LINE__) -> Result<T,NSError> {
public func `try`<T>(_ file: String = #file, line: Int = #line, f: (NSErrorPointer) -> T?) -> Result<T,NSError> {
  var error: NSError?
  return f(&error).map(success) ?? failure(error ?? defaultError(file, line: line))
}

// Uwi, 2015-03-08: fixed this (pull request from modocache, pull request #38)
//public func try(f: NSErrorPointer -> Bool, file: String = __FILE__, line: Int = __LINE__) -> Result<(),NSError> {
public func `try`(_ file: String = #file, line: Int = #line, f: (NSErrorPointer) -> Bool) -> Result<(),NSError> {

  var error: NSError?
  return f(&error) ? success(()) : failure(error ?? defaultError(file, line: line))
}

/// Container for a successful value (T) or a failure with an E
public enum Result<T,E> {
  case success(Box<T>)
  case failure(Box<E>)

  /// The successful value as an Optional
  public var value: T? {
    switch self {
    case .success(let box): return box.unbox
    case .failure: return nil
    }
  }

  /// The failing error as an Optional
  public var error: E? {
    switch self {
    case .success: return nil
    case .failure(let err): return err.unbox
    }
  }

  public var isSuccess: Bool {
    switch self {
    case .success: return true
    case .failure: return false
    }
  }

  /// Return a new result after applying a transformation to a successful value.
  /// Mapping a failure returns a new failure without evaluating the transform
  public func map<U>(_ transform: (T) -> U) -> Result<U,E> {
    switch self {
    case .success(let box):
      return .success(Box(transform(box.unbox)))
    case .failure(let err):
      return .failure(err)
    }
  }

  /// Return a new result after applying a transformation (that itself
  /// returns a result) to a successful value.
  /// Calling with a failure returns a new failure without evaluating the transform
  public func flatMap<U>(_ transform:(T) -> Result<U,E>) -> Result<U,E> {
    switch self {
    case .success(let value): return transform(value.unbox)
    case .failure(let error): return .failure(error)
    }
  }
}

extension Result: CustomStringConvertible {
  public var description: String {
    switch self {
    case .success(let box):
      return "Success: \(box.unbox)"
    case .failure(let error):
      return "Failure: \(error.unbox)"
    }
  }
}

/// Failure coalescing
///    .Success(Box(42)) ?? 0 ==> 42
///    .Failure(NSError()) ?? 0 ==> 0
public func ??<T,E>(result: Result<T,E>, defaultValue:  @autoclosure () -> T) -> T {
  switch result {
  case .success(let value):
    return value.unbox
  case .failure( _):
    return defaultValue()
  }
}

/// Equatable
/// Equality for Result is defined by the equality of the contained types
public func ==<T, E>(lhs: Result<T, E>, rhs: Result<T, E>) -> Bool where T: Equatable, E: Equatable {
    switch (lhs, rhs) {
    case let (.success(l), .success(r)): return l.unbox == r.unbox
    case let (.failure(l), .failure(r)): return l.unbox == r.unbox
    default: return false
    }
}

public func !=<T, E>(lhs: Result<T, E>, rhs: Result<T, E>) -> Bool where T: Equatable, E: Equatable {
  return !(lhs == rhs)
}

/// Due to current swift limitations, we have to include this Box in Result.
/// Swift cannot handle an enum with multiple associated data (A, NSError) where one is of unknown size (A)
final public class Box<T> {
  public let unbox: T
  public init(_ value: T) { self.unbox = value }
}
