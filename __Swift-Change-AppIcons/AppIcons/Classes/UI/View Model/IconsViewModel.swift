//
//  IconsViewModel.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation
import CoreGraphics

public protocol ViewControllerCompletionDelegate: class {
    func viewControllerFinished()
}

protocol ViewModel {}

class IconsViewModel: ViewModel {
    
    typealias Delegate = ViewControllerCompletionDelegate
    
    private weak var completionDelegate: Delegate?
    private let iconsService = Services.icons
    let cornerRadius: CGFloat?
    private let primaryIconName: String
    private let primaryIconFileName: String?
    let title = "Customise Icon"
    
    init(configuration: AppIcons.Configuration, completion: Delegate? = nil) {
        self.completionDelegate = completion
        self.cornerRadius = configuration.cornerRadius
        self.primaryIconName = configuration.primaryIconName
        self.primaryIconFileName = configuration.primaryIconFileName
    }
    
    func icon(at indexPath: IndexPath) -> Icon? {
        guard let icons = iconsService.icons(primaryIconName: primaryIconName, primaryIconFileName: primaryIconFileName) else {
            return nil
        }
        var icon = icons.all[indexPath.item]
        icon.cornerRadius = cornerRadius
        return icon
    }
    
    func iconsCount() -> Int {
        guard let icons = iconsService.icons(primaryIconName: primaryIconName, primaryIconFileName: primaryIconFileName) else {
            return 0
        }
        return icons.all.count
    }
    
    func selectIcon(at indexPath: IndexPath) {
        guard let icon = self.icon(at: indexPath) else {
            return
        }
        iconsService.setPreferredIcon(icon, completion: nil)
    }
    
}

extension IconsViewModel: Equatable {
    
    static func == (lhs: IconsViewModel, rhs: IconsViewModel) -> Bool {
        return lhs === rhs
    }
    
}

extension IconsViewModel: ViewControllerCompletionDelegate {
    
    func viewControllerFinished() {
        completionDelegate?.viewControllerFinished()
    }
    
}
