var message = ""
var ages = (10, 30)

switch ages {
   case (10, 20):
      message = "Too close"
   case (10, 30):
      message = "The right age"  // "The right age"
   case (10, 40):
      message = "Too far"
   default:
      message = "Way too far"
}
