//
//  Reducable.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

public protocol Reducible {
    mutating func reduce(_ action: AnyAction)
}
