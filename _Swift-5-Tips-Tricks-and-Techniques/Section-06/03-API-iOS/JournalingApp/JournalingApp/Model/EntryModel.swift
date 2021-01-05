//
//  EntryModel.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 18.01.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

class EntryModel: ObservableObject {
    
    @Published var entries: [Entry] = []
    
    init(entries: [Entry] = []) {
        self.entries = entries
    }
}
