//
//  SettingsViewModel.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import Combine

// MARK:- Settings View Model
final class SettingsViewModel: ObservableObject {
    // MARK: Properties
    @Published var passwordsAreBeingGenerated: Bool = false
    
    @Published var quantity: Int = 10
    static let quantityRange: ClosedRange<Int> = 1...100
    
    @Published var length: Int = 16
    static let lengthRange: ClosedRange<Int> = 8...1024
    
    @Published var type: PasswordType = .randomized
    
    @Published var random: RandomSettingsViewModel = .init()
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: Initializers
    init() {
        subscriptions.insert(random.objectWillChange.sink(receiveValue: { [weak self] in self?.objectWillChange.send() }))
    }
}
