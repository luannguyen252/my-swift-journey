
//: [Previous](@previous)

/**
 
 # FUNCTORS
 
 A functor is any data type that can be mapped over using `map`, as
 long as it abides by two laws:
 
 1) If your map function is the identity function (i.e. it just returns each element
 without transformation), then your input and output must be the same.
 
 2) If you compose function A and function B to make function C
 then use the result with map(), the result
 should be the same as mapping first A then B individually.
 
 # MONADS
 
 A monads is a type of functor that also implements `flatMap`.
 
 🔑 Furthermore, they abide by three laws.
 */


//: [Next](@next)
