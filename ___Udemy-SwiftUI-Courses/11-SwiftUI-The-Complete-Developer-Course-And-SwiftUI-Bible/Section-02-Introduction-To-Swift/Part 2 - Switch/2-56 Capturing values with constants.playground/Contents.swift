var message = ""
var ages = (10, 20)

switch ages {
   case (let x, 20):
      message = "Too close to \(x)"  // "Too close to 10"
   case (_, 30):
      message = "The right age"
   case (let x, 40):
      message = "Too far to \(x)"
   default:
      message = "Way too far"
}
