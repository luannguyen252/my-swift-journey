var mytext = "Hello"
var counter = 0

for letter in mytext {
   guard letter != "l" else {
      break
   }
   counter += 1
}
var message = "The string contains \(counter) letters"  // 2
