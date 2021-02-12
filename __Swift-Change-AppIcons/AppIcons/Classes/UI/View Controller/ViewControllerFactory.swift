//
//  ViewControllerFactory.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation
import UIKit

protocol Factory {
    associatedtype T
    func manufacture() -> T
}

protocol ViewControllerFactory: Factory
    where T == UIViewController {
}
