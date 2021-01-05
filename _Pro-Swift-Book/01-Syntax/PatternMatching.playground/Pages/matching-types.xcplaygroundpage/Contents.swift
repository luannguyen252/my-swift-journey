//: [Previous](@previous)

import UIKit

//let viewElement: AnyObject = UIButton()
let viewElement: AnyObject = UIControl()

switch viewElement {
case is UISwitch:
    print("switch found a Switch")
case is UIButton:
    print("Found a button")
default:
    print("Cases fell through for \(type(of: viewElement))")
}



let views: [UIView] = [
    UILabel(),
    UIButton(),
    UIButton(),
    UITabBar(),
    UISlider(),
    UITextView()
]

for view in views where view is UIControl {
    print("\(type(of: view)) is a UIControl")
}


/// Even though `where` ensures only specific objects are processed in the loop,
/// it doesn’t actually do any typecasting.
///
/// This means if you wanted to access type-specific properties, you need to typecast it yourself.
///
/// In this situation, using `for case let` instead is easier, as this filters and typecasts in one.

for case let control as UIControl in views {
    print("\(type(of: control)) is in state \"\(control.state)\"")
}






//: [Next](@next)
