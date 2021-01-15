//
//  ApiProtocol.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Foundation

protocol ApiProtocol {
    func getCheeses(completionHandler: @escaping (Result<[Cheese],Error>) -> Void)
}
