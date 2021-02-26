var message = ""
var ages = (10, 30)

switch ages {
   case (_, 20):
      message = "Too close"
   case (_, 30):
      message = "The right age"  // "The right age"
   case (_, 40):
      message = "Too far"
   default:
      message = "Way too far"
}
