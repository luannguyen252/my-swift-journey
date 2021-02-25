//
//  FetchUser.swift
//  Social App
//
//  Created by Balaji on 16/09/20.
//

import SwiftUI
import Firebase

// Global Refernce

let ref = Firestore.firestore()

func fetchUser(uid: String,completion: @escaping (UserModel) -> ()){
    
    ref.collection("Users").document(uid).getDocument { (doc, err) in
        guard let user = doc else{return}
        
        let username = user.data()?["username"] as! String
        let pic = user.data()?["imageurl"] as! String
        let bio = user.data()?["bio"] as! String
        let uid = user.documentID
        
        DispatchQueue.main.async {
            completion(UserModel(username: username, pic: pic, bio: bio, uid: uid))
        }
    }
}
