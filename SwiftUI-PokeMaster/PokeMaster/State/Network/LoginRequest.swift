//
//  LoginRequest.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/31.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation
import Combine

struct LoginRequest {
    
    let email: String
    let password: String
    
    var publisher: AnyPublisher<User, AppError> {
        
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                if self.password == "good" {
                    let user = User(email: self.email, favoritePokemonIDs: [])
                    promise(.success(user))
                }else {
                    promise(.failure(.passwordWrong))
                }
                
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}


enum AppError: Error, Identifiable {
    
    var id: String { localizedDescription }
    
    case passwordWrong
}

extension AppError: LocalizedError {
    
    var localizedDescription: String {
        
        switch self {
        case .passwordWrong: return "密码错误"
        }
    }
}
