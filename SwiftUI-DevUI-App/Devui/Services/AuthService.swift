//
//  AuthService.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

class AuthService: ObservableObject {
    @Published var apiKey: String?
    
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        self.apiKey = defaults.string(forKey: Keys.defaultsAPIKey)
    }
    
    func saveAPIKey(_ apiKey: String) {
        self.defaults.setValue(apiKey, forKey: Keys.defaultsAPIKey)
        self.apiKey = apiKey
    }
    
    func removeAPIKey() {
        self.defaults.removeObject(forKey: Keys.defaultsAPIKey)
        self.apiKey = nil
    }
}
