//
//  AppIconsViewControllerFactory.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation
import UIKit

struct IconsViewControllerFactory: ViewControllerFactory {
    
    typealias Delegate = ViewControllerCompletionDelegate
    
    private weak var completionDelegate: Delegate?
    private let configuration: AppIcons.Configuration
    
    init(configuration: AppIcons.Configuration, completion: Delegate? = nil) {
        self.completionDelegate = completion
        self.configuration = configuration
    }
    
    func manufacture() -> UIViewController {
        let viewController = AppIconsViewController()
        let viewModel = IconsViewModel(configuration: configuration, completion: completionDelegate)
        viewController.configure(viewModel)
        return viewController
    }
    
}
