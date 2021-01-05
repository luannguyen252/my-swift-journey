import UIKit

func attack() -> (damageDone: Int, xpEarned: Int) {
    return (Int.random(in: 0...4), Int.random(in: 1...30))
}


let (damage, xp) = attack()

print(damage)
print(xp)



/// Swap variables by destructuring tuples

var a = "🙂"
var b = "🧛‍♂️"

(a, b) = (b, a)

print(a)
print(b)
