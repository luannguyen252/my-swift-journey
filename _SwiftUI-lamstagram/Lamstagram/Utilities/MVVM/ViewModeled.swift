//
//  ViewModeled.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

public protocol ViewModeled {
    associatedtype ViewModel

    // swiftlint:disable:next implicitly_unwrapped_optional
    var viewModel: ViewModel! { get set }
}
