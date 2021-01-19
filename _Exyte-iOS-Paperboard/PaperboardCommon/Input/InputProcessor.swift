//
//  InputProcessor.swift
//  Paperboard
//
//  Created by Igor Zapletnev on 13.12.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import Foundation

protocol InputProcessor {
    func getText() -> String
    func append(text: String)
    func clear()
    func backspace()
    func capsLock()
    func isCaps() -> Bool
    func left()
    func right()
    func done()
}
