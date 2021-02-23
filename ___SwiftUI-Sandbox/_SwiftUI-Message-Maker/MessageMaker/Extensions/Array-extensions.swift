//
//  Array-extensions.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

// Source: Paul Hudson - Hacking With Swift
// https://www.hackingwithswift.com/example-code/language/how-to-make-array-access-safer-using-a-custom-subscript

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }

        return self[index]
    }
}
