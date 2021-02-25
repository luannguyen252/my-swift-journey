//
//  AuthService.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct AuthService {
  
  private var db = Firestore.firestore()
  
  func currentUser() -> User? {
    guard Auth.auth().currentUser != nil else { return nil }
    
    if let savedUser = UserDefaults.standard.object(forKey: Constants.CURRENT_USER) as? Data {
      let decoder = JSONDecoder()
      if let loadedPerson = try? decoder.decode(User.self, from: savedUser) {
        return loadedPerson
      }
    }
    return nil
  }
  
  func loginUser(withEmail email: String,
                 andPassword password: String,
                 completion: @escaping (_ error: Error?) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
      guard error == nil else {
        completion(error)
        return
      }
      guard let authResult = authResult else { return }
      
      self.saveUserToDefaults(userID: authResult.user.uid)
      
      completion(nil)
    }
  }
  
  func sendPasswordReset(email: String, completion: @escaping () -> Void) {
    Auth.auth().sendPasswordReset(withEmail: email) { error in
      completion()
    }
  }
  
  func register(user: User, completion: @escaping (_ error: Error?) -> Void) {
    Auth.auth().createUser(withEmail: user.email, password: user.password) { (authResult, error) in
      guard error == nil else {
        completion(error)
        return
      }
      guard let authResult = authResult else { return }
    
      user.userId = authResult.user.uid
      
      do {
      let _ = try db.collection(Constants.USERS_COLLECTION).addDocument(from: user)
        completion(nil)
      }
      catch let registerError {
        completion(registerError)
      }
    }
  }
  
  private func saveUserToDefaults(userID: String) {
    db.collection(Constants.USERS_COLLECTION)
      .whereField("userId", isEqualTo: userID)
      .getDocuments { (querySnapshot, error) in
        if error != nil {
          return
        }
        
        guard let documents = querySnapshot?.documents else { return }
        
        if let user = try? documents.first?.data(as: User.self) {
          UserDefaults.standard.set(true, forKey: Constants.LOGGED_IN)
          if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: Constants.CURRENT_USER)
          }
        }
      }
  }
}
