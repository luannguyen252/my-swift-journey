//
//  ViewModelConfigurable.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation

protocol ViewModelConfigurable {
    associatedtype T: Equatable & ViewModel
    func configure(_ viewModel: T)
    func viewModel() -> T
}
