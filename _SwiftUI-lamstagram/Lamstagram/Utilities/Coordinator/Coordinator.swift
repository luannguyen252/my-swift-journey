//
//  Coordinator.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    var assembler: Assembler { get }
    var storyboard: UIStoryboard { get }

    func start()
}

// MARK: - Dependency Injection

public extension Coordinator {
    func resolve<Service>(_ serviceType: Service.Type, synchronize: Bool = false) -> Service {
        guard synchronize else {
            // swiftlint:disable:next force_unwrapping
            return assembler.resolver.resolve(serviceType)!
        }

        let container = assembler.resolver as? Container

        // swiftlint:disable:next force_unwrapping
        return container!.synchronize().resolve(serviceType)!
    }

    func resolve<Service: ViewModeled>(_ serviceType: Service.Type, viewModel: Service.ViewModel, synchronize: Bool = false) -> Service? {
        var instance = resolve(serviceType, synchronize: synchronize)

        instance.viewModel = viewModel

        return instance
    }
}
