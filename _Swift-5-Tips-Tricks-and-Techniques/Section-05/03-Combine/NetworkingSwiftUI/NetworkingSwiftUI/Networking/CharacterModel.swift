//
//  CharacterModel.swift
//  NetworkingSwiftUI
//
//  Created by Philipp Baldauf on 22.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

class CharacterModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
}
