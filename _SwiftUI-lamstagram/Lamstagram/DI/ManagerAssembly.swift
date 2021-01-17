//
//  ManagerAssembly.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject

final class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(APIManaging.self) { _ in
            APIManager()
        }.inObjectScope(.container)
    }
}
