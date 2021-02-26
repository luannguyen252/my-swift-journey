var age = 6
var message = "You go to "
switch age {
   case 2, 3, 4:
      message += "Day Care"
   case 5, 6, 7, 8, 9, 10, 11:
      message += "Elementary School"  // "You go to Elementary School"
   case 12, 13, 14, 15, 16, 17:
      message += "High School"
   case 18, 19, 20, 21:
      message += "College"
   default:
      message += "Work"
}
