//
//  ViewModelingDelegate.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

protocol ViewModelingDelegate: AnyObject {
    func stateDidChange(previousState: State)
}
