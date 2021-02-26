var message = ""
var ages = (10, 20)

switch ages {
   case let (x, y) where x > y:
      message = "Too young"
   case let (x, y) where x == y:
      message = "The same age"
   case let (x, y) where x < y:
      message = "Too old"  // "Too old"
   default:
      message = "Not found"
}
