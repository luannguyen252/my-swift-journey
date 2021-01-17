//
//  DIContainer.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject

class DIContainer {
    static let current = DIContainer()
    
    let assembler = Assembler()
    
    init() {
        assembleDependencyInjectionContainer()
    }
    
    func assembleDependencyInjectionContainer() {
        assembler.apply(
            assemblies: [
                ManagerAssembly(),
                ServiceAssembly(),
                ViewModelAssembly()
            ]
        )
    }
}
