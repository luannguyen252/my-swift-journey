//
//  AuthService.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation

struct AuthService {
  
  func currentUser() -> User? {
    return nil
  }
  
  func loginUser(withEmail email: String,
                 andPassword password: String,
                 completion: @escaping (_ error: Error?) -> Void) {
    //TODO implement with firebase
    completion(nil)
  }
  
  func sendPasswordReset(email: String, completion: @escaping () -> Void) {
    //TODO implement with firebase
    completion()
  }
  
  func register(user: User, completion: @escaping (_ error: Error?) -> Void) {
    //TODO implement with firebase
  }
}
