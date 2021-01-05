import UIKit

let score = 1_000_000

print(String(score))

print(Int("42") ?? 0)
print(Int("Fiddy") ?? 0)


/// Using radices

let base16 = String(32, radix: 16)
let base2 = String(100, radix: 2)

print(String(100, radix: 2, uppercase: true))

print(Int("1C", radix: 16) ?? "0")

