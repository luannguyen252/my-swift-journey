//
//  RoomService.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import Foundation
import Firebase
import FirebaseFirestoreTarget

struct RoomService {
  var db = Firestore.firestore()
  
  func getRooms(completion: @escaping ([Room]?) -> Void) {
    db.collection(Constants.ROOMS_COLLECTION)
      .getDocuments { (querySnapshot, error) in
        if error != nil {
          completion(nil)
          return
        }
        
        guard let documents = querySnapshot?.documents else {
          completion(nil)
          return
        }
        
        var fetchedRooms: [Room] = []
        
        for document in documents {
          if let room = try? document.data(as: Room.self) {
            fetchedRooms.append(room)
          }
        }
        completion(fetchedRooms)
      }
  }
}
