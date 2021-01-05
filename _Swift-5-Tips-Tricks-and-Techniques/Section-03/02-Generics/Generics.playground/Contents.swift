import UIKit

var str = "Hello, playground"

func getMiddleElementInt(fromArray array: [Int]) -> Int? {
    guard !array.isEmpty else { return nil }
    return array[array.count / 2]
}

let i = getMiddleElementInt(fromArray: [10, 20, 30, 40, 50])
print(i)

func getMiddleElementString(fromArray array: [String]) -> String? {
    guard !array.isEmpty else { return nil }
    return array[array.count / 2]
}

let s = getMiddleElementString(fromArray: ["A", "B", "C", "D", "E"])
print(s)

func getMiddleElement<T>(fromArray array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    return array[array.count / 2]
}

let d = getMiddleElement(fromArray: [0.0, 0.5, 1.0])
print(d)







struct Stack<T> {
    private var values: [T] = []
    
    mutating func push(value: T) {
        values.insert(value, at: 0)
    }
    
    mutating func pop() -> T? {
        guard !values.isEmpty else { return nil }
        return values.remove(at: 0)
    }
    
    var isEmpty: Bool {
        return values.isEmpty
    }
}


var stack = Stack<Int>()
print("STACK")
stack.push(value: 10)
stack.push(value: 5)
stack.push(value: 15)
print(stack.pop())
print(stack.pop())
print(stack.isEmpty)
print(stack.pop())
print(stack.isEmpty)



struct EquatableStack<T: Equatable> {
    
    private var values: [T] = []
    
    mutating func pushIfUnique(value: T) {
        if !values.contains(value) {
            push(value: value)
        }
    }
    
    mutating func push(value: T) {
        values.insert(value, at: 0)
    }
    
    mutating func pop() -> T {
        return values.remove(at: 0)
    }
    
    var isEmpty: Bool {
        return values.isEmpty
    }
}


extension Stack where T: Equatable {
    mutating func pushIfUnique(value: T) {
        if !values.contains(value) {
            push(value: value)
        }
    }
}

stack.pushIfUnique(value: 1)
