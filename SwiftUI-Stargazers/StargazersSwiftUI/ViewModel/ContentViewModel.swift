//
//  ContentViewModel.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import Foundation

/// View model for the main content view
/// Uses two Published variables to track the text input
/// and has 3 Combine publishers to validate the inputs
class ContentViewModel:ObservableObject {
    @Published var owner:String = ""
    @Published var repository:String = ""
    
    /// Use CombineLatest to create a Publisher combining
    /// the output of two publishers
    var enableSearch:AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(validOwner, validRepository)
            .map {$0 && $1}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    /// Publisher connected to owner @Published var
    /// that publish a Bool value to check if the username is valid
    /// by checking its character count
    var validOwner:AnyPublisher<Bool, Never> {
        return $owner
            .map {$0.count > 0}
            .eraseToAnyPublisher()
    }

    /// Returns a Bool by checking the character count of
    /// the Published var repository
    var validRepository:AnyPublisher<Bool, Never> {
        return $repository
            .map {$0.count > 0}
            .eraseToAnyPublisher()
    }
}
