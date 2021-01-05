//: [Previous](@previous)

import Foundation

enum WeaponType {
    case sword
    case staff
    case bow(arrows: Int)
}

let weapon = WeaponType.bow(arrows: 20)

/// When switching on enums with associated values, we can use the associated
/// binding to it, binding to it AND filtering on that binding, or just ignoring it.

/// Ignore it
switch weapon {
case .bow:
    print("You have a bow")
case .staff:
    print("You have a staff")
case .sword:
    print("You have a sword")
}


/// Bind to it
switch weapon {
case .bow(let arrows):
    print("You have a bow with \(arrows) arrows")
case .staff:
    print("You have a staff")
case .sword:
    print("You have a sword")
}


/// Bind to it and filter
switch weapon {
case .bow(let arrows) where arrows < 1:
    print("You have a bow -- but no arrows!")
case .bow(let arrows) where (1...9).contains(arrows):
    print("You have a bow and a handful of arrows")
case .bow(let arrows) where arrows > 100:
    print("You have a bow with a lot of arrows (\(arrows))")
case .bow(let arrows):
    print("You have a bow with \(arrows) arrows")
case .staff:
    print("You have a staff")
case .sword:
    print("You have a sword")
}


let arsenal: [WeaponType] = [
    .bow(arrows: 0),
    .bow(arrows: 10),
    .bow(arrows: 10),
    .bow(arrows: 20),
    .bow(arrows: 30),
    .bow(arrows: 50),
    .bow(arrows: 50),
    .sword,
    .sword,
    .sword,
    .staff,
]


for case let .bow(arrowCount) in arsenal {
    print("Arsenal has a bow with \(arrowCount) arrows")
}

for case .bow(50) in arsenal {
    print("Take this bow. It has \(50) arrows")
}

for case .sword in arsenal {
    print("Using a sword")
}


//: [Next](@next)
