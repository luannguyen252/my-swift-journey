//
//  State.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

enum State {
    case initial
    case loading
    case ready
    case failed(Error)

    var inProgress: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
}
