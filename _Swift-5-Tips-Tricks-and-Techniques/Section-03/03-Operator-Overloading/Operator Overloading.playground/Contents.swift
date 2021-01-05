import UIKit

struct Product: Hashable {
    
    let name: String
    let price: Double
}

struct Order {
    
    /// The products that were ordered and the corresponding quantity.
    let products: [Product: Int]
    
    static func +(lhs: Order, rhs: Order) -> Order {
        var allProducts = lhs.products
        for (product, amount) in rhs.products {
            if let curAmount = allProducts[product] {
                allProducts[product] = amount + curAmount
            } else {
                allProducts[product] = amount
            }
        }
        return Order(products: allProducts)
    }
}


let order = Order(products: [Product(name: "Water", price: 0.49): 10, Product(name: "Rice", price: 1.29): 1])
let order2 = Order(products: [Product(name: "Water", price: 0.49): 3, Product(name: "Noodles", price: 2.29): 4])

let totalOrder = order + order2
print(totalOrder)



infix operator ^^

extension Double {
    static func ^^(lhs: Double, rhs: Double) -> Double {
        return pow(lhs, rhs)
    }
}

print(2^^8)




postfix operator ++
prefix operator ++

extension Int {
    
    static postfix func ++(lhs: Int) -> Int {
        return lhs + 1
    }
    
    static prefix func ++(rhs: Int) -> Int {
        return rhs + 1
    }
}

let i = 1
let j = i++
print("I: \(i)")
print("J: \(j)")
print("Post and pre \(++1++)")
