var age = 19
var message = "The customer is "
if age < 21 {
   message += "underage"  // "The customer is underage"
} else if age > 21 {
   message += "allowed"
} else {
   message += "21 years old"
}
