//: [Previous](@previous)

import Foundation

var deque1 = Deque([4, 4, 4, 4])

print(deque1.popFront() ?? "Nope")


var deque2 = Deque<String>()

print(deque2.isEmpty)

deque2.pushFront("A")
deque2.pushFront("B")
deque2.pushFront("C")
deque2.pushBack("D")

print(deque2.popFront() ?? "")
print(deque2.popBack() ?? "")



//: [Next](@next)
