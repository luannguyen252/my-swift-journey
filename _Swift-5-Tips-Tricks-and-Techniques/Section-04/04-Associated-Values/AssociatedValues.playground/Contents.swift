import UIKit

enum ProductType: CustomStringConvertible {
    case phone(storage: Int)
    case tv(inches: Int)
    case washingMachine(laundryWeight: Double, dryerCapability: Bool)
    
    var description: String {
        switch self {
        case .phone(let storage):
            return "Phone with \(storage)gb"
        case .tv(let inches):
            return "Tv with \(inches)\""
        case .washingMachine(_, let dryerCapability):
            if dryerCapability {
                return "Washdryer"
            } else {
                return "Washing machine"
            }
        }
    }
}

let phone = ProductType.phone(storage: 64)
let tv = ProductType.tv(inches: 55)
let washingMachine = ProductType.washingMachine(laundryWeight: 7.5, dryerCapability: false)
let washDryer = ProductType.washingMachine(laundryWeight: 6.5, dryerCapability: true)

print(phone)
print(tv)
print(washingMachine)
print(washDryer)


if case .phone(let storage) = tv {
    print("Phone with \(storage)")
} else {
    print("not a phone")
}
