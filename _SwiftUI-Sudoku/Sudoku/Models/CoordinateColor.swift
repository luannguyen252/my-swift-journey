import SwiftUI

struct CoordinateColor {
    let coordinate: CoordinateValue
    let color: Color
    
    var s: Int {
        coordinate.s
    }
    
    var r: Int {
        coordinate.r
    }
    
    var c: Int {
        coordinate.c
    }
}
