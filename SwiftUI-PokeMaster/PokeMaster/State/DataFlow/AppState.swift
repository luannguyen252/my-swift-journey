//
//  AppState.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/31.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation

struct AppState {
    
    var settings = Settings()
}

extension AppState {
    
    struct Settings {
        
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
        @UserDefaultStorage(key: "showEnglishName")
        var showEnglishName: Bool
        
        var sorting = Sorting.id
        var showFavoriteOnly = false
        
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        
        var loginRequesting = false
        var loginError: AppError?
    }
    
    
}
