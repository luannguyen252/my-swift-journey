var mytext = "Hello"
var message = ""

for letter in mytext {
   message += message != "" ? "-" : ""
   message += "\(letter)"
}
