//
//  LoginHandler.swift
//  AirbnbClone-SwiftUI
//
//  Created by Keerthi on 23/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import Combine
import Alamofire

class LoginHandler: APIHandler {
    
    @Published var loginModel: LoginModel?
    @Published var isLoading = false
            
    func callLoginAPI(parameters: [String: Any]) {
        isLoading = true
        
        let url = "BaseUrl/login"
        AF.request(url, method: .post, parameters: parameters).responseDecodable { [weak self] (response: DataResponse<LoginModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? LoginModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.loginModel = response
        }
    }
    
}

class APIHandler {
        
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
}
