import UIKit

/**
    Swift has a specialized form of map() called compactMap(), which applies a
    compacting step once the map() operation has completed: all optionals get
    unwrapped, and any that contained nil get discarded.
 */


let albums: [String?] = ["Fearless", nil, "Red", nil, "1989"]

print(albums.compactMap { $0 })


/**
    Because the compactMap's compacting happens after the mapping, it
    will actually run on the results of the transform that we apply to
    each initial value.
 */

let scores = ["100", "1", "0", "Top Score", "331"]
let validScores = scores.compactMap { Int($0) }

print(validScores)


let num: Double = 10


/**
    `compactMap` can be especially handy when combined with `as?`
 */

let view = UIView()

// .... imaginary complex view assembly ....

let labels = view.subviews.compactMap { $0 as? UILabel }
